﻿package com.ankamagames.dofus.network.types.game.actions.fight
{
    import com.ankamagames.jerakine.network.INetworkType;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class FightTemporaryBoostStateEffect extends FightTemporaryBoostEffect implements INetworkType 
    {

        public static const protocolId:uint = 214;

        public var stateId:int = 0;


        override public function getTypeId():uint
        {
            return (214);
        }

        public function initFightTemporaryBoostStateEffect(uid:uint=0, targetId:int=0, turnDuration:int=0, dispelable:uint=1, spellId:uint=0, effectId:uint=0, parentBoostUid:uint=0, delta:int=0, stateId:int=0):FightTemporaryBoostStateEffect
        {
            super.initFightTemporaryBoostEffect(uid, targetId, turnDuration, dispelable, spellId, effectId, parentBoostUid, delta);
            this.stateId = stateId;
            return (this);
        }

        override public function reset():void
        {
            super.reset();
            this.stateId = 0;
        }

        override public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_FightTemporaryBoostStateEffect(output);
        }

        public function serializeAs_FightTemporaryBoostStateEffect(output:ICustomDataOutput):void
        {
            super.serializeAs_FightTemporaryBoostEffect(output);
            output.writeShort(this.stateId);
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_FightTemporaryBoostStateEffect(input);
        }

        public function deserializeAs_FightTemporaryBoostStateEffect(input:ICustomDataInput):void
        {
            super.deserialize(input);
            this.stateId = input.readShort();
        }


    }
}//package com.ankamagames.dofus.network.types.game.actions.fight

