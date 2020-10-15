package config;

import misc.Macros;
import haxe.Json;
import com.bitdecay.analytics.Bitlytics;
import openfl.Assets;
import com.bitdecay.net.influx.InfluxDB;

class Configure {
	private static var config:Dynamic;
	private static var analyticsToken:String;

	public static function initAnalytics() {
		var devMode = false;

		if (config == null) {
			devMode = !loadConfig();
		}

		Bitlytics.Init(config.analytics.name, InfluxDB.load(config.analytics.influx, analyticsToken), devMode);
		Bitlytics.Instance().NewSession();
	}

	public static function getCredits():Array<CreditEntry> {
		if (config == null) {
			loadConfig();
		}

		var creditSections:Array<CreditEntry> = config.credits.sections;
		return creditSections;
	}

	private static function loadConfig() {
		var configBytes = Assets.getBytes(AssetPaths.config__json).toString();
		config = Json.parse(configBytes);

		// Check compile defines first
		if (Macros.isDefined("API_KEY")) {
			var define = Macros.getDefine("API_KEY");
			// our define comes back as <val>=<val>
			// Take the first half explicitly, as splitting on '=' might have unexpected
			// behavior if the token has '=' characters in it
			analyticsToken = define.substr(0, Std.int(define.length / 2));
			return true;
		} else {
			trace('No API_KEY compile flag found. Production metrics will not work.');
			return false;
		}
	}
}