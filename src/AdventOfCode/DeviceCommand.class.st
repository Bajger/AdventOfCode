"
AoC 2022 - Day 7 part 1 - device filesystem command
"
Class {
	#name : 'DeviceCommand',
	#superclass : 'Object',
	#instVars : [
		'device'
	],
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'private - testing' }
DeviceCommand class >> matchCommand: cmdString [

	^ false
]

{ #category : 'instance creation' }
DeviceCommand class >> newFrom: aTermLine [
	|aDeviceClass|
	aDeviceClass :=	self subclasses detect: [: aClass | aClass matchCommand: aTermLine substrings second ].
	^ aDeviceClass new 
]

{ #category : 'instance creation' }
DeviceCommand class >> on: aDevice [

	^ (self newFrom: aDevice termLine)
		device: aDevice;
		yourself
]

{ #category : 'accessing' }
DeviceCommand >> device [

	^ device
]

{ #category : 'accessing' }
DeviceCommand >> device: anObject [

	device := anObject
]

{ #category : 'execution' }
DeviceCommand >> execute [

	self subclassResponsibility
]

{ #category : 'execution' }
DeviceCommand >> shouldProceed [

	^ self device lineNumber < self device termLines size
]
