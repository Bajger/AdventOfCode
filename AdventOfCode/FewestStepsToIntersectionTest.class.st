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
