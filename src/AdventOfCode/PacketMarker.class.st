"
AoC 2022 - Day 6 part 1
"
Class {
	#name : 'PacketMarker',
	#superclass : 'AoC2022',
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'api actions' }
PacketMarker >> compute [

	self packetSize to: self input size do: [ :idx | 
		| aSet |
		aSet := (self input copyFrom: idx - (self packetSize - 1) to: idx)
			        asSet.
		aSet size = self packetSize ifTrue: [ ^ idx ] ].
	self error: 'Start of packet not found'
]

{ #category : 'private' }
PacketMarker >> packetSize [

	^ 4
]
