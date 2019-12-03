Class {
	#name : #CrossedWiresIntersection,
	#superclass : #AoC2019,
	#instVars : [
		'firstWire',
		'secondWire'
	],
	#category : #AdventOfCode
}

{ #category : #accessing }
CrossedWiresIntersection >> firstWire [
	^ firstWire
]

{ #category : #accessing }
CrossedWiresIntersection >> firstWire: anObject [
	firstWire := anObject
]

{ #category : #initialize }
CrossedWiresIntersection >> getNewWire [

	^ PathShape new
      addVertex: 0@0; 
		yourself
]

{ #category : #initialize }
CrossedWiresIntersection >> initialize [ 
	self firstWire: self getNewWire.
	self secondWire: self getNewWire.
	
]

{ #category : #accessing }
CrossedWiresIntersection >> secondWire [
	^ secondWire
]

{ #category : #accessing }
CrossedWiresIntersection >> secondWire: anObject [
	secondWire := anObject
]
