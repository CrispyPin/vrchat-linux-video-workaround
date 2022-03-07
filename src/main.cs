//#define LOG_ARGS // goes to yt-dlp-args.log
#define LOG_REQUESTS // goes to yt-dlp.log

// Waits for the vrc-video-url-handler.sh to place the raw url in /tmp/VRC_VIDEO_RAW_URL
//#define RETURN_URL

using System;
using System.IO;
using System.Diagnostics;
using System.Threading;


namespace yt_dlp_replacement {
class Program
{
	static void Main(string[] args)
	{
#if LOG_ARGS
		string args_s = "";
		for (int i = 0; i < args.Length; i++)
		{
			args_s += args[i] + " ";
		}
		args_s += "\n";
		File.AppendAllText("yt-dlp-args.txt", args_s);
#endif
		

#if LOG_REQUESTS
		File.AppendAllText("yt-dlp.log", "requested: " + args[args.Length - 1] + "\n");
#endif

		// run vrc-video-url-handler.sh with the video url
		Process sh_process = new Process();
		sh_process.StartInfo.UseShellExecute = true;
		sh_process.StartInfo.FileName = "/bin/bash";

		string video_url = args[args.Length - 1];
		sh_process.StartInfo.Arguments = "-c \"vrc-video-url-handler.sh " + video_url + "\"";

		sh_process.Start();
			
#if RETURN_URL
		string url_file = "/tmp/VRC_VIDEO_RAW_URL";
		string raw_url = "url handler did not return anything";
		// wait 4 seconds for result
		for (int i = 0; i < 40; i++) {
			Thread.Sleep(100);
			if (File.Exists(url_file)) {
				string contents = File.ReadAllText(url_file);
				if (contents != "") {
					raw_url = contents;
					break;
				}
			}
		}
		// print result so that vrchat can use it
		Console.Write(raw_url);

#if LOG_REQUESTS
		File.AppendAllText("yt-dlp.log", "returned: '"+ raw_url + "'\n");
#endif

#endif // RETURN_URL
	}
}}
