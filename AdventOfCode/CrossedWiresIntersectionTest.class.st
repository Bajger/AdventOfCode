Class {
	#name : #CrossedWiresIntersectionTest,
	#superclass : #TestCase,
	#instVars : [
		'crossedWiresInstance'
	],
	#category : #'AdventOfCode-Tests'
}

{ #category : #accessing }
CrossedWiresIntersectionTest >> crossedWiresInstance [
	^ crossedWiresInstance
]

{ #category : #accessing }
CrossedWiresIntersectionTest >> crossedWiresInstance: anObject [
	crossedWiresInstance := anObject
]

{ #category : #running }
CrossedWiresIntersectionTest >> setUp [ 
	super setUp.
	self crossedWiresInstance: CrossedWiresIntersection new.
	
]

{ #category : #tests }
CrossedWiresIntersectionTest >> testEmptyIntersection [

	self assertCollection: self crossedWiresInstance getIntersections hasSameElements: {}.


]

{ #category : #tests }
CrossedWiresIntersectionTest >> testIntersection [
	self crossedWiresInstance moveUp: 1 on: crossedWiresInstance firstWire.
	self crossedWiresInstance moveRight: 1 on: crossedWiresInstance firstWire.
	self crossedWiresInstance moveUp: 1 on: crossedWiresInstance firstWire.
	self crossedWiresInstance moveRight: 1 on: crossedWiresInstance firstWire.
	self crossedWiresInstance moveRight: 1 on: crossedWiresInstance secondWire.
	self crossedWiresInstance moveUp: 1 on: crossedWiresInstance secondWire.
	self crossedWiresInstance moveRight: 1 on: crossedWiresInstance secondWire.
	self crossedWiresInstance moveUp: 1 on: crossedWiresInstance secondWire.
	
	self assertCollection: self crossedWiresInstance getIntersections hasSameElements: {0@0. 1@1. 2@2}.


]

{ #category : #tests }
CrossedWiresIntersectionTest >> testMoveDownOn [

self crossedWiresInstance moveDown: 10 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveDown: 2 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveDown: 1 on: crossedWiresInstance secondWire.
self crossedWiresInstance moveDown: 5 on: crossedWiresInstance secondWire.

self assert: self crossedWiresInstance firstWire vertices size equals: 3.
self assert: self crossedWiresInstance secondWire vertices size equals: 3.

self assert: self crossedWiresInstance firstWire vertices last equals: 0@(-12). 
self assert: self crossedWiresInstance secondWire vertices last equals: 0@(-6).

]

{ #category : #tests }
CrossedWiresIntersectionTest >> testMoveLeftOn [

self crossedWiresInstance moveLeft: 7 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveLeft: 5 on: crossedWiresInstance secondWire.
self crossedWiresInstance moveLeft: 1 on: crossedWiresInstance secondWire.

self assert: self crossedWiresInstance firstWire vertices size equals: 2.
self assert: self crossedWiresInstance secondWire vertices size equals: 3.

self assert: self crossedWiresInstance firstWire vertices last equals: -7@0. 
self assert: self crossedWiresInstance secondWire vertices last equals: -6@0.

]

{ #category : #tests }
CrossedWiresIntersectionTest >> testMoveRightOn [

self crossedWiresInstance moveRight: 12 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveRight: 2 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveRight: 1 on: crossedWiresInstance secondWire.

self assert: self crossedWiresInstance firstWire vertices size equals: 3.
self assert: self crossedWiresInstance secondWire vertices size equals: 2.

self assert: self crossedWiresInstance firstWire vertices last equals: 14@0. 
self assert: self crossedWiresInstance secondWire vertices last equals: 1@0.

]

{ #category : #tests }
CrossedWiresIntersectionTest >> testMoveRightUpLeftDownOn [

self crossedWiresInstance moveRight: 12 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveUp: 2 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveLeft: 2 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveDown: 10 on: crossedWiresInstance firstWire.

self assert: self crossedWiresInstance firstWire vertices size equals: 5.

self assert: self crossedWiresInstance firstWire vertices last equals: 10@(-8). 

]

{ #category : #tests }
CrossedWiresIntersectionTest >> testMoveUpOn [

self crossedWiresInstance moveUp: 1 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveUp: 2 on: crossedWiresInstance firstWire.
self crossedWiresInstance moveUp: 1 on: crossedWiresInstance secondWire.
self crossedWiresInstance moveUp: 1 on: crossedWiresInstance secondWire.

self assert: self crossedWiresInstance firstWire vertices size equals: 3.
self assert: self crossedWiresInstance secondWire vertices size equals: 3.

self assert: self crossedWiresInstance firstWire vertices last equals: 0@3. 
self assert: self crossedWiresInstance secondWire vertices last equals: 0@2.

]
