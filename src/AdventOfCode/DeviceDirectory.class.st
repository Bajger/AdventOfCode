"
AoC 2022 - Day 7 part 1 - device directory
"
Class {
	#name : #DeviceDirectory,
	#superclass : #DeviceFSReference,
	#instVars : [
		'contents',
		'parent'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'api actions' }
DeviceDirectory >> allSubDirs [

	|aColl|
	aColl := OrderedCollection new. 
	self allSubDirsTo: aColl.
	^ aColl 
]

{ #category : #private }
DeviceDirectory >> allSubDirsTo: aColl [

	|dirs|
	dirs := self contents select: #isDirectory.
	dirs ifEmpty: [ ^ aColl ] ifNotEmpty: [ aColl addAll: dirs. 
		^ dirs do: [: e | e allSubDirsTo: aColl ]
		 ]
	
]

{ #category : #accessing }
DeviceDirectory >> contents [

	^ contents
]

{ #category : #accessing }
DeviceDirectory >> contents: anObject [

	contents := anObject
]

{ #category : #'api actions' }
DeviceDirectory >> find: aReferenceName [
	aReferenceName = '/' ifTrue: [ ^ self findRoot]. 
	^ self contents detect: [ :aRef | aRef name = aReferenceName ] ifNone: [  ]
]

{ #category : #'api actions' }
DeviceDirectory >> findRoot [
	
	(self name = '/' and: [ self parent isNil ]) ifTrue: [ ^ self ].
	^ self parent findRoot 
]

{ #category : #initialization }
DeviceDirectory >> initialize [
	
	self contents: OrderedCollection new.
	
]

{ #category : #'api actions' }
DeviceDirectory >> isDirectory [ 

	^ true
]

{ #category : #'api actions' }
DeviceDirectory >> makeDirectory: aDirName [

	|aDir| 
	aDir := self class named: aDirName.
	aDir parent: self.
	self contents add: aDir.
	^ aDir
]

{ #category : #'api actions' }
DeviceDirectory >> makeFile: fileName [

	|aFile|
 	aFile := DeviceFile named: fileName.
	self contents add: aFile.
	^ aFile
]

{ #category : #accessing }
DeviceDirectory >> parent [

	^ parent
]

{ #category : #accessing }
DeviceDirectory >> parent: anObject [

	parent := anObject
]

{ #category : #'api actions' }
DeviceDirectory >> sizeOnDevice [

	^ self contents sum: #sizeOnDevice
]
