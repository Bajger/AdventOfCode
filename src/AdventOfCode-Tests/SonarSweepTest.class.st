"
A SonarSweepTest is a test class for testing the behavior of SonarSweep
"
Class {
	#name : #SonarSweepTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2021'
}

{ #category : #test }
SonarSweepTest >> testCompute [
	
	|aSonarSweep|
	aSonarSweep := SonarSweep new.
	aSonarSweep input: '1
	2
	3
	4
	3'.
	self assert: aSonarSweep compute equals: 3.
]

{ #category : #test }
SonarSweepTest >> testComputeAocSample [
	
	|aSonarSweep|
	aSonarSweep := SonarSweep new.
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
	self assert: aSonarSweep compute equals: 7.
]

{ #category : #test }
SonarSweepTest >> testComputeSample1 [
	
	|aSonarSweep|
	aSonarSweep := SonarSweep new.
	aSonarSweep input: '1
	2
	3
	4
	3'.
	self assert: aSonarSweep compute equals: 3.
]

{ #category : #test }
SonarSweepTest >> testComputeSample2 [
	
	|aSonarSweep|
	aSonarSweep := SonarSweep new.
	aSonarSweep input: '1
	2
	3
	4'.
	self assert: aSonarSweep compute equals: 3.
]

{ #category : #test }
SonarSweepTest >> testComputeSample3 [
	
	|aSonarSweep|
	aSonarSweep := SonarSweep new.
	aSonarSweep input: '1
	2
	3
	3
	3'.
	self assert: aSonarSweep compute equals: 2.
]
