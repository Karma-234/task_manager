packages:
	flutter pub add flutter_screenutil google_fonts json_serializable json_annotation auto_route logging hive mobx flutter_mobx

packages-dev: 
	flutter pub add build_runner mobx_codegen auto_route_generator chopper_generator --dev
build-run: 
	dart run build_runner build --delete-conflicting-outputs
clean:
	flutter clean
	echo Done flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	flutter pub get
	cd ios && pod install
	flutter run