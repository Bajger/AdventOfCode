"
A LongPacketMarkerTest is a test class for testing the behavior of LongPacketMarker
"
Class {
	#name : #LongPacketMarkerTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
LongPacketMarkerTest >> testCompute [
	| marker|
	marker := LongPacketMarker new.
	self assert: marker compute equals: 2421.
]

{ #category : #tests }
LongPacketMarkerTest >> testComputeSamples [
	|inputs marker|
	marker := LongPacketMarker new.
	inputs := { 
	'mjqjpqmgbljsphdztnvjfqwrcgsmlb' -> 19.
	'bvwbjplbgvbhsrlpgdmjqwftvncz' -> 23.
	'nppdvjthqldpwncqszvftbrmjlhg' -> 23.
	'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' -> 29.
	'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' -> 26.
	}.
	inputs do: [:packet |
		marker input: packet key.
		self assert: marker compute equals: packet value.
	].
]
