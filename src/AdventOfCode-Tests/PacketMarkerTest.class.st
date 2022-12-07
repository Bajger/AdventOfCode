"
A PacketMarkerTest is a test class for testing the behavior of PacketMarker
"
Class {
	#name : #PacketMarkerTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
PacketMarkerTest >> testCompute [
	| marker|
	marker := PacketMarker new.
	self assert: marker compute equals: 1100.
]

{ #category : #tests }
PacketMarkerTest >> testComputeSamples [
	|inputs marker|
	marker := PacketMarker new.
	inputs := { 
	'mjqjpqmgbljsphdztnvjfqwrcgsmlb' -> 7.
	'bvwbjplbgvbhsrlpgdmjqwftvncz' -> 5.
	'nppdvjthqldpwncqszvftbrmjlhg' -> 6.
	'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' -> 10.
	'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' -> 11.
	}.
	inputs do: [:packet |
		marker input: packet key.
		self assert: marker compute equals: packet value.
	].
]
