"
2019 - day 6 part 2
"
Class {
	#name : #OrbitalTransfers,
	#superclass : #UniversalOrbitMap,
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #'api actions' }
OrbitalTransfers >> compute [ 
	|santa you ancestor|
	self processOrbitMap.
	santa := self getOrCreateObjectNamed: 'SAN'.
	you := self getOrCreateObjectNamed: 'YOU'.
	ancestor := santa findCommonOrbitAncestorOf: you.
	^ (santa orbits hopsToObject: ancestor) + (you orbits hopsToObject: ancestor)
]
