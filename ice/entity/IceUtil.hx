package ice.entity;

import haxe.io.Eof;
import openfl.Assets;
#if !flash
import sys.io.File;
import sys.io.FileInput;
#end

/**
 * ...
 * @author 
 */
class IceUtil
{
	public function new()
	{
		
	}
	
	/**
	 * Loads a text file from disk
	 * @param	path		relative path to the text file
	 * @param	useAssets	whether to use Openfl.Assets (required on flash)
	 */
	static public function LoadString(path:String, useAssets:Bool):String
	{
		var string:String = "";
		#if flash
		if (!useAssets)
		{
			throw "run time file loading is not supported on flash";
		}
		#end
		if (useAssets)
		{
			return Assets.getText(path);
		}
		else
		{
			#if !flash
			try
			{
				var fileIn = File.read(path, false);
				while (true)
				{
					string += fileIn.readLine();
				}
				fileIn.close();
			}
			catch (ex:Eof)
			{
				return string;
			}
			#end
		}

		return string;
	}
}