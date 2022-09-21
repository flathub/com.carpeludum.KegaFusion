#!/bin/sh

kega_libdir="/app/lib/KegaFusion"
kega_localdir="$XDG_CONFIG_HOME/.Kega Fusion"

# create local plugins directory if not present
mkdir -p "$kega_localdir/Plugins"

# remove dead link
rm -f "$kega_localdir/Plugins/"[*]

# create links for every included plugin
for i in $kega_libdir/Plugins/*; do
  if [ ! -e "$kega_localdir/Plugins/$(basename "$i")" ]; then
    ln -sf "$i" "$kega_localdir/Plugins/"
  fi
done

# copy configuration file if not present
if ! [ -f "$kega_localdir/Fusion.ini" ]; then
  cp $kega_libdir/Fusion.ini "$kega_localdir"
fi

# here we go!
export LD_PRELOAD=/app/lib32/libfix-config-location.so
$kega_libdir/Fusion "$@"
