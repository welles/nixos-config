# Brother MFC-J5345DW (home network, IoT VLAN)
#
# Adds the inkjet MFC as a fixed CUPS queue using the driverless IPP
# Everywhere / AirPrint path (image/urf over IPP). The printer reports zero
# margins as supported, so the PPD offers "*.Borderless" page sizes
# (A4, A3, A5, A6, 10x15 cm, 13x18 cm, …) for borderless printing.
#
# The queue is declared statically because mDNS discovery does not cross
# into the IoT VLAN. The PPD is checked in (generated once with
# `driverless cat ipp://BRWF0A654BDBC9C/ipp/print`) instead of letting
# lpadmin build it via `-m everywhere`: that would query the printer during
# activation and fail whenever it is switched off or the machine is away
# from home. Regenerate the PPD after firmware updates if options change.
#
# Requires services.printing (modules/printing.nix).
{pkgs, ...}: let
  ppd = pkgs.runCommand "brother-mfc-j5345dw-ppd" {} ''
    install -Dm644 ${./brother-mfc-j5345dw.ppd} $out/share/cups/model/brother-mfc-j5345dw.ppd
  '';
in {
  services.printing.drivers = [ppd];

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother_MFC-J5345DW";
        description = "Brother MFC-J5345DW";
        location = "Home";
        deviceUri = "ipp://BRWF0A654BDBC9C/ipp/print";
        model = "brother-mfc-j5345dw.ppd";
        ppdOptions = {
          PageSize = "A4";
          MediaType = "Stationery";
        };
      }
    ];
    ensureDefaultPrinter = "Brother_MFC-J5345DW";
  };
}
