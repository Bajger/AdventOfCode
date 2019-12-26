"
A FewestStepsToIntersectionTest is a test class for testing the behavior of FewestStepsToIntersection
"
Class {
	#name : #FewestStepsToIntersectionTest,
	#superclass : #TestCase,
	#instVars : [
		'fewestStepsInstance'
	],
	#category : #'AdventOfCode-Tests'
}

{ #category : #accessing }
FewestStepsToIntersectionTest >> fewestStepsInstance [
	^ fewestStepsInstance
]

{ #category : #accessing }
FewestStepsToIntersectionTest >> fewestStepsInstance: anObject [
	fewestStepsInstance := anObject
]

{ #category : #running }
FewestStepsToIntersectionTest >> setUp [ 
	super setUp.
	self fewestStepsInstance:  FewestStepsToIntersection new.
	
]

{ #category : #running }
FewestStepsToIntersectionTest >> testCompute [
self assert: (self fewestStepsInstance compute) equals: 20386
]

{ #category : #running }
FewestStepsToIntersectionTest >> testFewestSteps410 [
self assert: (self fewestStepsInstance input: 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
U98,R91,D20,R16,D67,R40,U7,R15,U6,R7'; compute) equals: 410
]

{ #category : #running }
FewestStepsToIntersectionTest >> testFewestSteps610 [
self assert: (self fewestStepsInstance input: 'R75,D30,R83,U83,L12,D49,R71,U7,L72
U62,R66,U55,R34,D71,R55,D58,R83'; compute) equals: 610
]

{ #category : #running }
FewestStepsToIntersectionTest >> testFewestStepsTo3a3and6a5 [
self assert: (self fewestStepsInstance input: 'R8,U5,L5,D3
U7,R6,D4,L4'; compute) equals: 30
]

{ #category : #running }
FewestStepsToIntersectionTest >> testFewestStepsTo5a5and10a10 [
self assert: (self fewestStepsInstance input: 'R5,U5,R5,U5
U5,R5,U5,R5'; compute) equals: 20
]
