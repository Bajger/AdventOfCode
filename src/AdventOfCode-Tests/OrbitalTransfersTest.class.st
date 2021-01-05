Class {
	#name : #OrbitalTransfersTest,
	#superclass : #UniversalOrbitMapTest,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #'as yet unclassified' }
OrbitalTransfersTest >> anotherSampleInput [
^
'COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
K)YOU
I)SAN'
]

{ #category : #tests }
OrbitalTransfersTest >> testAllOrbitHops [
	| aMap com b c l|
	aMap := OrbitalTransfers new
		input: self sampleInput;
		processOrbitMap;
		yourself.
	com := aMap getOrCreateObjectNamed: 'COM'.
	b := aMap getOrCreateObjectNamed: 'B'.
	c := aMap getOrCreateObjectNamed: 'C'.
	l := aMap getOrCreateObjectNamed: 'L'.
	self assert: com allOrbitHops size equals: 0.
	self assert: b allOrbitHops size equals: 1.
	self assert: c allOrbitHops size equals: 2.
	self assert: c orbits allOrbitHops size equals: 1.
	self assert: l allOrbitHops size equals: 7.
	
	self assert: (b allOrbitHops includes: com) equals: true.
	self assert: (l allOrbitHops includesAll: (#('K' 'J' 'E' 'D' 'C' 'B' 'COM') collect: [:i | aMap getOrCreateObjectNamed: i])) equals: true.
]

{ #category : #tests }
OrbitalTransfersTest >> testAnotherSampleInput [

	self assert: (OrbitalTransfers new input: self anotherSampleInput; compute) equals: 4.
]

{ #category : #tests }
OrbitalTransfersTest >> testCommonAncestors [
	| aMap com b c d i l|
	aMap := OrbitalTransfers new
		input: self sampleInput;
		processOrbitMap;
		yourself.
	com := aMap getOrCreateObjectNamed: 'COM'.
	b := aMap getOrCreateObjectNamed: 'B'.
	c := aMap getOrCreateObjectNamed: 'C'.
	d := aMap getOrCreateObjectNamed: 'D'.
	i := aMap getOrCreateObjectNamed: 'I'.
	l := aMap getOrCreateObjectNamed: 'L'.
	self assert: (l findCommonOrbitAncestorOf: i) equals: d.
	self assert: (i findCommonOrbitAncestorOf: l) equals: d.
	
	self assert: (d findCommonOrbitAncestorOf: l) equals: c.
	self assert: (l findCommonOrbitAncestorOf: d) equals: c.
	
	self assert: (b findCommonOrbitAncestorOf: l) equals: com.
	self assert: (l findCommonOrbitAncestorOf: b) equals: com.
]

{ #category : #tests }
OrbitalTransfersTest >> testHopsToAncestor [
	| aMap com b c d i l|
	aMap := OrbitalTransfers new
		input: self sampleInput;
		processOrbitMap;
		yourself.
	com := aMap getOrCreateObjectNamed: 'COM'.
	b := aMap getOrCreateObjectNamed: 'B'.
	c := aMap getOrCreateObjectNamed: 'C'.
	d := aMap getOrCreateObjectNamed: 'D'.
	i := aMap getOrCreateObjectNamed: 'I'.
	l := aMap getOrCreateObjectNamed: 'L'.

	self assert: (com hopsToObject: b) equals: 0.
	self assert: (b hopsToObject: com) equals: 1.
	self assert: (l hopsToObject: d) equals: 4.
	self assert: (l hopsToObject: i) equals: 0.
]

{ #category : #tests }
OrbitalTransfersTest >> testPuzzleInput [

	self assert: (OrbitalTransfers new compute) equals: 511.
]
