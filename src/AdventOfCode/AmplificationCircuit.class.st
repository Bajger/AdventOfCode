Class {
	#name : #AmplificationCircuit,
	#superclass : #AoC2019,
	#instVars : [
		'amplifiers'
	],
	#category : #'AdventOfCode-day7'
}

{ #category : #accessing }
AmplificationCircuit >> amplifiers [
	^ amplifiers
]

{ #category : #accessing }
AmplificationCircuit >> amplifiers: anObject [
	amplifiers := anObject
]

{ #category : #initialize }
AmplificationCircuit >> initialize [ 
	
	super initialize.
	self amplifiers: OrderedCollection new.
	
]
