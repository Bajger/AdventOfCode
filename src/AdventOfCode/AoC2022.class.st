"
AoC 2022 solutions

"
Class {
	#name : #AoC2022,
	#superclass : #AoC,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #executing }
AoC2022 class >> aocSolutionClasses [
	^ 
	{	ElfCalories. ElfCaloriesTopThree.
		RockPaperScissors. FindAShape.
		RucksackItems. ThreeElfItems.
		CampCleanup. RangesOverlap.
		SupplyStacks. MultipleCratesAtOnce.
		PacketMarker. LongPacketMarker.
		DeviceDirectorySize. DirectorySizeToRunUpdate.
		TreeVisibility. ScenicScore.
		TailPositions. RopeTailPositions.
	}
]

{ #category : #executing }
AoC2022 class >> solutionYearString [

	^ '2022'
]
