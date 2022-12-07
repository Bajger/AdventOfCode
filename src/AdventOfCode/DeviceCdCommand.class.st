Class {
	#name : #DeviceCdCommand,
	#superclass : #DeviceCommand,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'private - testing' }
DeviceCdCommand class >> matchCommand: cmdString [

	^ cmdString = 'cd'
]

{ #category : #execution }
DeviceCdCommand >> changeDirTo: changeDirName [
	changeDirName = '/' ifTrue: [^ self device currentDirectory: self device currentDirectory findRoot ]. 
	changeDirName = '..' ifTrue: [ self device currentDirectory: self device currentDirectory parent ]
	ifFalse: [ 
		| newDir |
		newDir := device currentDirectory find: changeDirName.
		newDir ifNil: [ 
			Error signal: 'Directory not found. Cannot change directory.' ].
		self device currentDirectory: newDir 
	]
]

{ #category : #execution }
DeviceCdCommand >> execute [

	| changeDirName |
	changeDirName := self device termLine substrings last.
	self changeDirTo: changeDirName.
	^ self shouldProceed ifTrue: [self device nextTermLine. true ]
]
