Class {
	#name : #TailNodeChanged,
	#superclass : #Announcement,
	#instVars : [
		'tailPoint'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #accessing }
TailNodeChanged >> tailPoint [

	^ tailPoint
]

{ #category : #accessing }
TailNodeChanged >> tailPoint: anObject [

	tailPoint := anObject
]
