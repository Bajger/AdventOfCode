"
AoC 2022 - Day 7 part 1 - device file reference
"
Class {
	#name : #DeviceFSReference,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'instance creation' }
DeviceFSReference class >> named: refName [

	^ self new 
		name: refName 
		yourself 
]

{ #category : #testing }
DeviceFSReference >> isDirectory [

	^ false 
]

{ #category : #accessing }
DeviceFSReference >> name [

	^ name
]

{ #category : #accessing }
DeviceFSReference >> name: anObject [

	name := anObject
]
