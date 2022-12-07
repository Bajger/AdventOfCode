Class {
	#name : #DeviceFile,
	#superclass : #DeviceFSReference,
	#instVars : [
		'size'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #accessing }
DeviceFile >> size [

	^ size
]

{ #category : #accessing }
DeviceFile >> size: anObject [

	size := anObject
]

{ #category : #accessing }
DeviceFile >> sizeOnDevice [

	^ size
]
