﻿package com.ankamagames.dofus.network.messages.game.actions.fight
{
    import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import com.ankamagames.dofus.network.types.game.look.EntityLook;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class GameActionFightChangeLookMessage extends AbstractGameActionMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5532;

        private var _isInitialized:Boolean = false;
        public var targetId:int = 0;
        public var entityLook:EntityLook;

        public function GameActionFightChangeLookMessage()
        {
            this.entityLook = new EntityLook();
            super();
        }

        override public function get isInitialized():Boolean
        {
            return (((super.isInitialized) && (this._isInitialized)));
        }

        override public function getMessageId():uint
        {
            return (5532);
        }

        public function initGameActionFightChangeLookMessage(actionId:uint=0, sourceId:int=0, targetId:int=0, entityLook:EntityLook=null):GameActionFightChangeLookMessage
        {
            super.initAbstractGameActionMessage(actionId, sourceId);
            this.targetId = targetId;
            this.entityLook = entityLook;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            super.reset();
            this.targetId = 0;
            this.entityLook = new EntityLook();
            this._isInitialized = false;
        }

        override public function pack(output:ICustomDataOutput):void
        {
            var data:ByteArray = new ByteArray();
            this.serialize(new CustomDataWrapper(data));
            writePacket(output, this.getMessageId(), data);
        }

        override public function unpack(input:ICustomDataInput, length:uint):void
        {
            this.deserialize(input);
        }

        override public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_GameActionFightChangeLookMessage(output);
        }

        public function serializeAs_GameActionFightChangeLookMessage(output:ICustomDataOutput):void
        {
            super.serializeAs_AbstractGameActionMessage(output);
            output.writeInt(this.targetId);
            this.entityLook.serializeAs_EntityLook(output);
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_GameActionFightChangeLookMessage(input);
        }

        public function deserializeAs_GameActionFightChangeLookMessage(input:ICustomDataInput):void
        {
            super.deserialize(input);
            this.targetId = input.readInt();
            this.entityLook = new EntityLook();
            this.entityLook.deserialize(input);
        }


    }
}//package com.ankamagames.dofus.network.messages.game.actions.fight

