Class {
	#name : #OrbitalTransfers,
	#superclass : #UniversalOrbitMap,
	#category : #'AdventOfCode-day6'
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
