#!/system/bin/sh

ui_print "         N e x u s i f y            "
ui_print "           Uninstaller            "
ui_print ""
sleep 1

print_success() {
  ui_print "[✅] $1"
}

print_info() {
  ui_print "[ℹ️] $1"
}

animated_dots() {
  local msg=$1
  local count=$2
  local i
  
  for i in $(seq 1 $count); do
    ui_print "$msg$(printf '.%.0s' $(seq 1 $i))"
    sleep 0.3
  done
}

animated_dots "⏳ Initializing uninstallation..." 3

print_info "Deleting module files..."
rm -rf /data/adb/modules/nexus
print_success "Module files deleted successfully."

print_info "Restoring apps..."

RESTORE_APPS=(
  "com.samsung.android.fast"
  "com.samsung.android.samsungpass"
  "com.samsung.android.ipsgeofence"
  "com.samsung.android.kidsinstaller"
  "com.microsoft.skydrive"
  "com.samsung.android.dynamiclock"
  "com.samsung.android.bbc.bbcagent"
  "com.samsung.android.app.spage"
  "com.android.cts.priv.ctsshim"
  "com.android.cts.ctsshim"
  "com.facebook.system"
  "com.facebook.services"
  "com.facebook.appmanager"
  "com.samsung.android.spaymini"
  "com.dsi.ant.server"
  "com.samsung.knox.keychain"
  "com.sec.android.app.factorykeystring"
  "com.snap.camerakit.plugin.v1"
  "com.sec.android.widgetapp.webmanual"
  "com.sec.android.soagent"
  "com.samsung.android.securitylogagent"
  "com.samsung.android.samsungpassautofill"
  "com.sec.android.app.chromecustomizations"
  "com.aura.oobe.samsung.gl"
  "com.samsung.android.app.updatecenter"
  "com.sec.android.app.parser"
  "com.samsung.android.app.simplesharing"
  "com.dsi.ant.service.socket"
  "com.android.managedprovisioning"
  "com.sec.android.preloadinstaller"
  "com.samsung.android.app.sbrowseredge"
  "com.microsoft.office.officehubrow"
  "com.monotype.android.font.samsungone"
  "flipboard.boxer.app"
  "com.mygalaxy"
  "com.samsung.android.emojiupdater"
  "com.sec.factory"
  "com.sec.android.app.billing"
  "com.samsung.android.app.omcagent"
  "com.android.dreams.phototable"
  "com.google.android.setupwizard"
  "com.samsung.faceservice"
  "com.samsung.android.coldwalletservice"
  "com.sec.android.diagmonagent"
  "com.wssyncmldm"
  "com.samsung.android.mdm"
  "com.sec.android.app.ve.vebgm"
  "com.samsung.android.app.separation"
  "com.amazon.appmanager"
  "com.samsung.android.mapsagent"
  "com.samsung.android.app.earphonetypec"
  "com.samsung.android.sm.devicesecurity"
  "com.google.android.feedback"
  "com.android.bookmarkprovider"
  "com.google.mainline.telemetry"
  "com.android.internal.display.cutout.emulation.waterfall"
  "com.google.android.onetimeinitializer"
  "com.sec.android.widgetapp.easymodecontactswidget"
  "com.sec.enterprise.knox.cloudmdm.smdms"
  "com.samsung.android.knox.analytics.uploader"
  "com.sec.android.app.wlantest"
)

count=0
total=${#RESTORE_APPS[@]}

for app in "${RESTORE_APPS[@]}"; do
  cmd package install-existing "$app" 2>/dev/null
  count=$((count + 1))
  printf "\r → Progress: [%3d/%3d] apps restored" "$count" "$total ←"
done

count=0
total=${#RESTORE_APPS[@]}

for app in "${RESTORE_APPS[@]}"; do
  cmd package install-existing "$app" 2>/dev/null
  count=$((count + 1))
  printf "\r → Progress: [%3d/%3d] apps restored" "$count" "$total ←"
done

ui_print ""
print_success "All apps restored successfully."

print_info "Restoring device configurations to stock... "
cmd device_config delete launcher long_press_home_button_to_search
cmd device_config delete launcher long_press_home_button_to_search_mpr
cmd device_config delete launcher press_hold_nav_handle_to_search
cmd device_config delete launcher press_hold_nav_handle_to_search_mpr
cmd device_config delete launcher ENABLE_LONG_PRESS_NAV_HANDLE
cmd device_config delete launcher ENABLE_LONG_PRESS_NAV_HANDLE_MPR
print_success "Restored device configurations to stock successfully."

print_info "Cleaning cache files... "
animated_dots "→ Cleaning... ←" 3

rm -rf /cache/*
rm -rf /data/cache/*
rm -rf /data/dalvik-cache/*
rm -rf /data/system/package_cache/*

print_success "Cleaned cache files succesfully. ←"

ui_print ""
ui_print "→      Nexus removing completed. ←"
ui_print "→   Reboot your device to apply changes. ←"
ui_print "→       Hope to see you again         ←"
ui_print ""
