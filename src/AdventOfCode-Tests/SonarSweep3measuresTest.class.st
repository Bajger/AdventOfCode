"
A SonarSweep3measuresTest is a test class for testing the behavior of SonarSweep3measures
"
Class {
	#name : #SonarSweep3measuresTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2021'
}

{ #category : #tests }
SonarSweep3measuresTest >> testComputeAocSample [	
	|aSonarSweep|
	aSonarSweep := SonarSweep3measures new.
	aSonarSweep input: '199
200
208
210
200
207
240
269
260
263'.
	self assert: aSonarSweep compute equals: 5.

]

{ #category : #tests }
SonarSweep3measuresTest >> testGetSonarDataAocSample [	
	|aSonarSweep|
	aSonarSweep := SonarSweep3measures new.
	aSonarSweep input: '199
200
208
210
200
207
240
269
260
263'.
	self assert: aSonarSweep getSonarData asArray equals: #(607 618 618 617 647 716 769 792).

]
