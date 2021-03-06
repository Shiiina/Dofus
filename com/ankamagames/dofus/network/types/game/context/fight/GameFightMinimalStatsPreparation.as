﻿package com.ankamagames.dofus.network.types.game.context.fight
{
    import com.ankamagames.jerakine.network.INetworkType;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    public class GameFightMinimalStatsPreparation extends GameFightMinimalStats implements INetworkType 
    {

        public static const protocolId:uint = 360;

        public var initiative:uint = 0;


        override public function getTypeId():uint
        {
            return (360);
        }

        public function initGameFightMinimalStatsPreparation(lifePoints:uint=0, maxLifePoints:uint=0, baseMaxLifePoints:uint=0, permanentDamagePercent:uint=0, shieldPoints:uint=0, actionPoints:int=0, maxActionPoints:int=0, movementPoints:int=0, maxMovementPoints:int=0, summoner:int=0, summoned:Boolean=false, neutralElementResistPercent:int=0, earthElementResistPercent:int=0, waterElementResistPercent:int=0, airElementResistPercent:int=0, fireElementResistPercent:int=0, neutralElementReduction:int=0, earthElementReduction:int=0, waterElementReduction:int=0, airElementReduction:int=0, fireElementReduction:int=0, criticalDamageFixedResist:int=0, pushDamageFixedResist:int=0, dodgePALostProbability:uint=0, dodgePMLostProbability:uint=0, tackleBlock:int=0, tackleEvade:int=0, invisibilityState:uint=0, initiative:uint=0):GameFightMinimalStatsPreparation
        {
            super.initGameFightMinimalStats(lifePoints, maxLifePoints, baseMaxLifePoints, permanentDamagePercent, shieldPoints, actionPoints, maxActionPoints, movementPoints, maxMovementPoints, summoner, summoned, neutralElementResistPercent, earthElementResistPercent, waterElementResistPercent, airElementResistPercent, fireElementResistPercent, neutralElementReduction, earthElementReduction, waterElementReduction, airElementReduction, fireElementReduction, criticalDamageFixedResist, pushDamageFixedResist, dodgePALostProbability, dodgePMLostProbability, tackleBlock, tackleEvade, invisibilityState);
            this.initiative = initiative;
            return (this);
        }

        override public function reset():void
        {
            super.reset();
            this.initiative = 0;
        }

        override public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_GameFightMinimalStatsPreparation(output);
        }

        public function serializeAs_GameFightMinimalStatsPreparation(output:ICustomDataOutput):void
        {
            super.serializeAs_GameFightMinimalStats(output);
            if (this.initiative < 0)
            {
                throw (new Error((("Forbidden value (" + this.initiative) + ") on element initiative.")));
            };
            output.writeVarInt(this.initiative);
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_GameFightMinimalStatsPreparation(input);
        }

        public function deserializeAs_GameFightMinimalStatsPreparation(input:ICustomDataInput):void
        {
            super.deserialize(input);
            this.initiative = input.readVarUhInt();
            if (this.initiative < 0)
            {
                throw (new Error((("Forbidden value (" + this.initiative) + ") on element of GameFightMinimalStatsPreparation.initiative.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.types.game.context.fight

