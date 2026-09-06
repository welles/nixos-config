#!/usr/bin/env bash
set -euo pipefail

usage() {
	cat <<'EOF'
Usage: search-tmdb (--show|-s|--movie|-m) [--name|-n <name>] [name...]

Search TheMovieDB for a show or movie and print results formatted as:
  [tmdbid-<id>] <name> (<year>)

The TheMovieDB URL for each result is appended, and the name is also
wrapped as a clickable hyperlink in terminals that support it.

The name to search for can be given with --name/-n, or as plain trailing
words, e.g. `search-tmdb --show The Sopranos`.

Options:
  --show, -s      Search TV shows
  --movie, -m     Search movies
  --name, -n      Name to search for (may also be given as trailing words)
  --help, -h      Show this help
EOF
}

media_type=""
name=""
positional=()

while [[ $# -gt 0 ]]; do
	case "$1" in
	--show | -s)
		[[ -n "$media_type" ]] && {
			echo "Error: --show and --movie are mutually exclusive." >&2
			exit 1
		}
		media_type="tv"
		shift
		;;
	--movie | -m)
		[[ -n "$media_type" ]] && {
			echo "Error: --show and --movie are mutually exclusive." >&2
			exit 1
		}
		media_type="movie"
		shift
		;;
	--name | -n)
		name="$2"
		shift 2
		;;
	--help | -h)
		usage
		exit 0
		;;
	--)
		shift
		positional+=("$@")
		break
		;;
	-*)
		echo "Unknown argument: $1" >&2
		usage
		exit 1
		;;
	*)
		positional+=("$1")
		shift
		;;
	esac
done

if [[ -z "$name" && ${#positional[@]} -gt 0 ]]; then
	name="${positional[*]}"
fi

if [[ -z "$media_type" ]]; then
	echo "Error: exactly one of --show or --movie is required." >&2
	exit 1
fi

if [[ -z "$name" ]]; then
	echo "Error: a name is required (via --name/-n or trailing words)." >&2
	exit 1
fi

if [[ -z "${TMDB_TOKEN_FILE:-}" || ! -r "$TMDB_TOKEN_FILE" ]]; then
	echo "Error: TMDB API token file not found (TMDB_TOKEN_FILE unset or unreadable)." >&2
	exit 1
fi
token=$(<"$TMDB_TOKEN_FILE")

encoded_name=$(jq -rn --arg n "$name" '$n|@uri')

if ! response=$(curl -sf \
	-H "Authorization: Bearer $token" \
	-H "accept: application/json" \
	"https://api.themoviedb.org/3/search/${media_type}?query=${encoded_name}&language=de-DE"); then
	echo "Error: Failed to retrieve data from TMDB." >&2
	exit 1
fi

echo "$response" | jq -c '.results[]' | while IFS= read -r item; do
	id=$(jq -r '.id' <<<"$item")
	if [[ "$media_type" == "tv" ]]; then
		item_name=$(jq -r '.name' <<<"$item")
		date_string=$(jq -r '.first_air_date' <<<"$item")
	else
		item_name=$(jq -r '.title' <<<"$item")
		date_string=$(jq -r '.release_date' <<<"$item")
	fi

	escaped_name=$(sed -E 's/[[:space:]]*[:|][[:space:]]*/ - /g' <<<"$item_name")
	escaped_name=$(sed -E 's/[<>"\/\\?*]//g' <<<"$escaped_name")
	escaped_name=$(sed -E 's/[[:space:]]+/ /g' <<<"$escaped_name")
	escaped_name=$(sed -E 's/^ +//; s/ +$//' <<<"$escaped_name")

	year=""
	if [[ -n "$date_string" && "$date_string" != "null" ]]; then
		year="${date_string%%-*}"
	fi

	url="https://www.themoviedb.org/${media_type}/${id}"

	if [[ -t 1 ]]; then
		display_name=$(printf '\e]8;;%s\e\\%s\e]8;;\e\\' "$url" "$escaped_name")
	else
		display_name="$escaped_name"
	fi

	if [[ -n "$year" ]]; then
		echo "[tmdbid-$id] $display_name ($year) - $url"
	else
		echo "[tmdbid-$id] $display_name - $url"
	fi
done
