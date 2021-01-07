Class {
	#name : #ThrustAmplifier,
	#superclass : #Object,
	#instVars : [
		'phaseSetting',
		'inputSignal',
		'outputSignal',
		'id'
	],
	#category : #'AdventOfCode-day7'
}

{ #category : #accessing }
ThrustAmplifier >> id [
	^ id
]

{ #category : #accessing }
ThrustAmplifier >> id: anObject [
	id := anObject
]

{ #category : #accessing }
ThrustAmplifier >> inputSignal [
	^ inputSignal
]

{ #category : #accessing }
ThrustAmplifier >> inputSignal: anObject [
	inputSignal := anObject
]

{ #category : #accessing }
ThrustAmplifier >> outputSignal [
	^ outputSignal
]

{ #category : #accessing }
ThrustAmplifier >> outputSignal: anObject [
	outputSignal := anObject
]

{ #category : #accessing }
ThrustAmplifier >> phaseSetting [
	^ phaseSetting
]

{ #category : #accessing }
ThrustAmplifier >> phaseSetting: anObject [
	phaseSetting := anObject
]
