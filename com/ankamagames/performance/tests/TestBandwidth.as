package com.ankamagames.performance.tests
{
   import com.ankamagames.performance.IBenchmarkTest;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.events.Event;
   import flash.utils.getTimer;
   import com.ankamagames.performance.Benchmark;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequestHeader;
   
   public class TestBandwidth extends Object implements IBenchmarkTest
   {
      
      public function TestBandwidth(loader:URLLoader = null, urlRequest:URLRequest = null) {
         super();
         if(!_results)
         {
            _results = [];
         }
         if(!urlRequest)
         {
            urlRequest = new URLRequest("http://dl.ak.ankama.com/games/dofus2-streaming/beta/dummy.version_" + new Date().time + ".file");
         }
         if(!loader)
         {
            loader = new URLLoader();
         }
         this._loader = loader;
         this._loader.addEventListener(Event.OPEN,this.onOpen);
         this._loader.addEventListener(Event.COMPLETE,this.onComplete);
         this._loader.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this._urlRequest = urlRequest;
         this._urlRequest.requestHeaders = [new URLRequestHeader("pragma","no-cache")];
      }
      
      private static var _results:Array;
      
      public static function resetResults() : void {
         _results = [];
      }
      
      public static function pushResult(speed:int) : void {
         if(!_results)
         {
            _results = [];
         }
         _results.push(speed);
      }
      
      public static function getResults() : String {
         var average:* = NaN;
         var i:* = 0;
         if(_results)
         {
            average = 0;
            i = 0;
            while(i < _results.length)
            {
               average = average + _results[i];
               i++;
            }
            average = average / _results.length;
            return "bandwidthTest:" + average.toString();
         }
         return "bandwidthTest:none";
      }
      
      private var _loader:URLLoader;
      
      private var _urlRequest:URLRequest;
      
      private var _startTime:Number;
      
      public function run() : void {
         this._loader.load(this._urlRequest);
      }
      
      private function onOpen(event:Event) : void {
         this._startTime = getTimer();
      }
      
      private function onError(event:Event) : void {
         this.clean();
         Benchmark.onTestCompleted(this);
      }
      
      private function onComplete(event:Event) : void {
         this.clean();
         var totalTime:Number = getTimer() - this._startTime;
         var totalBytes:uint = event.currentTarget.bytesTotal;
         var speed:int = totalBytes / totalTime;
         _results.push(speed);
         Benchmark.onTestCompleted(this);
      }
      
      private function clean() : void {
         this._loader.removeEventListener(Event.OPEN,this.onOpen);
         this._loader.removeEventListener(Event.COMPLETE,this.onComplete);
         this._loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this._loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
      }
   }
}
