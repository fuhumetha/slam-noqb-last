export MAX_DOWNLOAD_SPEED=0
tracker_list=$(curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt https://ngosang.github.io/trackerslist/trackers_all_http.txt https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all.txt https://raw.githubusercontent.com/hezhijie0327/Trackerslist/main/trackerslist_combine.txt | awk '$0' | tr '\n' ',')
export MAX_CONCURRENT_DOWNLOADS=5
aria2c --enable-rpc --max-connection-per-server=10 --bt-tracker="[$tracker_list]" --follow-torrent=mem --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS --max-tries=20 --auto-file-renaming=true --netrc-path=/usr/src/app/.netrc
