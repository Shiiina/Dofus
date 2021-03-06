﻿package com.ankamagames.dofus.network.types.game.context.fight
{
    import com.ankamagames.jerakine.network.INetworkType;
    import __AS3__.vec.Vector;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;
    import __AS3__.vec.*;

    public class FightExternalInformations implements INetworkType 
    {

        public static const protocolId:uint = 117;

        public var fightId:int = 0;
        public var fightType:uint = 0;
        public var fightStart:uint = 0;
        public var fightSpectatorLocked:Boolean = false;
        public var fightTeams:Vector.<FightTeamLightInformations>;
        public var fightTeamsOptions:Vector.<FightOptionsInformations>;

        public function FightExternalInformations()
        {
            this.fightTeams = new Vector.<FightTeamLightInformations>(2, true);
            this.fightTeamsOptions = new Vector.<FightOptionsInformations>(2, true);
            super();
        }

        public function getTypeId():uint
        {
            return (117);
        }

        public function initFightExternalInformations(fightId:int=0, fightType:uint=0, fightStart:uint=0, fightSpectatorLocked:Boolean=false, fightTeams:Vector.<FightTeamLightInformations>=null, fightTeamsOptions:Vector.<FightOptionsInformations>=null):FightExternalInformations
        {
            this.fightId = fightId;
            this.fightType = fightType;
            this.fightStart = fightStart;
            this.fightSpectatorLocked = fightSpectatorLocked;
            this.fightTeams = fightTeams;
            this.fightTeamsOptions = fightTeamsOptions;
            return (this);
        }

        public function reset():void
        {
            this.fightId = 0;
            this.fightType = 0;
            this.fightStart = 0;
            this.fightSpectatorLocked = false;
            this.fightTeams = new Vector.<FightTeamLightInformations>(2, true);
            this.fightTeamsOptions = new Vector.<FightOptionsInformations>(2, true);
        }

        public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_FightExternalInformations(output);
        }

        public function serializeAs_FightExternalInformations(output:ICustomDataOutput):void
        {
            output.writeInt(this.fightId);
            output.writeByte(this.fightType);
            if (this.fightStart < 0)
            {
                throw (new Error((("Forbidden value (" + this.fightStart) + ") on element fightStart.")));
            };
            output.writeInt(this.fightStart);
            output.writeBoolean(this.fightSpectatorLocked);
            var _i5:uint;
            while (_i5 < 2)
            {
                this.fightTeams[_i5].serializeAs_FightTeamLightInformations(output);
                _i5++;
            };
            var _i6:uint;
            while (_i6 < 2)
            {
                this.fightTeamsOptions[_i6].serializeAs_FightOptionsInformations(output);
                _i6++;
            };
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_FightExternalInformations(input);
        }

        public function deserializeAs_FightExternalInformations(input:ICustomDataInput):void
        {
            this.fightId = input.readInt();
            this.fightType = input.readByte();
            if (this.fightType < 0)
            {
                throw (new Error((("Forbidden value (" + this.fightType) + ") on element of FightExternalInformations.fightType.")));
            };
            this.fightStart = input.readInt();
            if (this.fightStart < 0)
            {
                throw (new Error((("Forbidden value (" + this.fightStart) + ") on element of FightExternalInformations.fightStart.")));
            };
            this.fightSpectatorLocked = input.readBoolean();
            var _i5:uint;
            while (_i5 < 2)
            {
                this.fightTeams[_i5] = new FightTeamLightInformations();
                this.fightTeams[_i5].deserialize(input);
                _i5++;
            };
            var _i6:uint;
            while (_i6 < 2)
            {
                this.fightTeamsOptions[_i6] = new FightOptionsInformations();
                this.fightTeamsOptions[_i6].deserialize(input);
                _i6++;
            };
        }


    }
}//package com.ankamagames.dofus.network.types.game.context.fight

