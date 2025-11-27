#
# Copyright (C) 2025 lyntaxxq, lyntaxqq
# The module maintainer is lyntaxxq
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# We are telling the phone needs to install module to this folder:
MODPATH="/data/adb/modules/Nexusify"

# Print installation
ui_print "→ Welcome User, This is Nexusify Installation Process ←"
ui_print "→ If you do not want to install Nexusify, quit from app now! ←"
ui_print "→ This module will remove so much apps for performance. ←"
ui_print "→ I am giving you 10 seconds for quiting. Stay in the app if you want to install Nexusify ←"
sleep 10
ui_print ""
ui_print ""
ui_print "→ Good, I will remove useless Samsung apps now. ←"
sleep 0.6
# Thanks to aliysnm for giving debloat list
ui_print ""
pm uninstall --user 0 com.samsung.android.fast
pm uninstall --user 0 com.samsung.android.samsungpass
pm uninstall --user 0 com.samsung.android.ipsgeofence
pm uninstall --user 0 com.samsung.android.kidsinstaller
pm uninstall --user 0 com.microsoft.skydrive
pm uninstall --user 0 com.samsung.android.dynamiclock
pm uninstall --user 0 com.samsung.android.bbc.bbcagent
pm uninstall --user 0 com.samsung.android.app.spage
pm uninstall --user 0 com.android.cts.priv.ctsshim
pm uninstall --user 0 com.android.cts.ctsshim
pm uninstall --user 0 com.facebook.system
pm uninstall --user 0 com.facebook.services
pm uninstall --user 0 com.facebook.appmanager
pm uninstall --user 0 com.samsung.android.spaymini
pm uninstall --user 0 com.dsi.ant.server
pm uninstall --user 0 com.samsung.knox.keychain
pm uninstall --user 0 com.sec.android.app.factorykeystring
pm uninstall --user 0 com.snap.camerakit.plugin.v1
pm uninstall --user 0 com.sec.android.widgetapp.webmanual
pm uninstall --user 0 com.sec.android.soagent
pm uninstall --user 0 com.samsung.android.securitylogagent
pm uninstall --user 0 com.samsung.android.samsungpassautofill
pm uninstall --user 0 com.sec.android.app.chromecustomizations
pm uninstall --user 0 com.aura.oobe.samsung.gl
pm uninstall --user 0 com.samsung.android.app.updatecenter
pm uninstall --user 0 com.sec.android.app.parser
pm uninstall --user 0 com.samsung.android.app.simplesharing
pm uninstall --user 0 com.dsi.ant.service.socket
pm uninstall --user 0 com.android.managedprovisioning
pm uninstall --user 0 com.sec.android.preloadinstaller
pm uninstall --user 0 com.samsung.android.app.sbrowseredge
pm uninstall --user 0 com.microsoft.office.officehubrow
pm uninstall --user 0 com.monotype.android.font.samsungone
pm uninstall --user 0 flipboard.boxer.app
pm uninstall --user 0 com.mygalaxy
pm uninstall --user 0 com.samsung.android.emojiupdater
pm uninstall --user 0 com.sec.factory
pm uninstall --user 0 com.sec.android.app.billing
pm uninstall --user 0 com.samsung.android.app.omcagent
pm uninstall --user 0 com.android.dreams.phototable
pm uninstall --user 0 com.google.android.setupwizard
pm uninstall --user 0 com.samsung.faceservice
pm uninstall --user 0 com.samsung.android.coldwalletservice
pm uninstall --user 0 com.sec.android.diagmonagent
pm uninstall --user 0 com.wssyncmldm
pm uninstall --user 0 com.samsung.android.mdm
pm uninstall --user 0 com.sec.android.app.ve.vebgm
pm uninstall --user 0 com.samsung.android.app.separation
pm uninstall --user 0 com.amazon.appmanager
pm uninstall --user 0 com.samsung.android.mapsagent
pm uninstall --user 0 com.samsung.android.app.earphonetypec
pm uninstall --user 0 com.samsung.android.sm.devicesecurity
pm uninstall --user 0 com.google.android.feedback
pm uninstall --user 0 com.android.bookmarkprovider
pm uninstall --user 0 com.google.mainline.telemetry
pm uninstall --user 0 com.android.internal.display.cutout.emulation.waterfall
pm uninstall --user 0 com.google.android.onetimeinitializer
pm uninstall --user 0 com.sec.android.widgetapp.easymodecontactswidget
pm uninstall --user 0 com.sec.enterprise.knox.cloudmdm.smdms
pm uninstall --user 0 com.samsung.android.knox.analytics.uploader
pm uninstall --user 0 com.sec.android.app.wlantest
cmd package install-existing com.sec.android.smartfpsadjuster
ui_print ""
ui_print ""
# Thanks to aliysnm again for device image configurations.
ui_print "→ I will apply device image configurations. ←"
su -c cp /data/adb/modules/AIonix/data/user_de/0/com.android.settings/files/DeviceImage.png /data/user_de/0/com.android.settings/files
su -c chmod 644 /data/user_de/0/com.android.settings/files/DeviceImage.png
ui_print ""
ui_print "→ Now I will delete cache for getting more space and performance. ←"
rm -rf /cache/*
rm -rf /data/cache/*
rm -rf /data/dalvik-cache/*
rm -rf /data/system/package_cache/*

ui_print "→ The installation finished. Reboot your device to apply changes. ←"
ui_print "→ by lyntaxxq, thnx to aliysnm. ←"