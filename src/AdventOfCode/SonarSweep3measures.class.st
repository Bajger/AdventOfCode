"
AoC 2021 - day 1 part 2
"
Class {
	#name : 'SonarSweep3measures',
	#superclass : 'SonarSweep',
	#category : 'AdventOfCode-AoC2021',
	#package : 'AdventOfCode',
	#tag : 'AoC2021'
}

{ #category : 'private ' }
SonarSweep3measures >> getSonarData [

	|threeMeasuresColl sonarData|
	sonarData := super getSonarData.
	threeMeasuresColl := OrderedCollection new.
	1 to: sonarData size - 2 do: [ :idx|
		threeMeasuresColl add: (sonarData at: idx) + (sonarData at: idx + 1) + (sonarData at: idx + 2)		 	].
	^ threeMeasuresColl 
]
