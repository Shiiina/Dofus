package com.ankamagames.dofus.network.messages.debug
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class DebugInClientMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function DebugInClientMessage() {
         super();
      }
      
      public static const protocolId:uint = 6028;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var level:uint = 0;
      
      public var message:String = "";
      
      override public function getMessageId() : uint {
         return 6028;
      }
      
      public function initDebugInClientMessage(param1:uint=0, param2:String="") : DebugInClientMessage {
         this.level = param1;
         this.message = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.level = 0;
         this.message = "";
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void {
         this.serializeAs_DebugInClientMessage(param1);
      }
      
      public function serializeAs_DebugInClientMessage(param1:IDataOutput) : void {
         param1.writeByte(this.level);
         param1.writeUTF(this.message);
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_DebugInClientMessage(param1);
      }
      
      public function deserializeAs_DebugInClientMessage(param1:IDataInput) : void {
         this.level = param1.readByte();
         if(this.level < 0)
         {
            throw new Error("Forbidden value (" + this.level + ") on element of DebugInClientMessage.level.");
         }
         else
         {
            this.message = param1.readUTF();
            return;
         }
      }
   }
}