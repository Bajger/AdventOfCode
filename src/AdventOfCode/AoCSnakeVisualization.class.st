"
Visualization of Rope tail positions - AoC2022 day 9 part 2
"
Class {
	#name : 'AoCSnakeVisualization',
	#superclass : 'Object',
	#instVars : [
		'announcer',
		'canvas',
		'shapes',
		'baseShape',
		'model',
		'grid',
		'sequence'
	],
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'instance creation' }
AoCSnakeVisualization class >> from: tailPositions [

	^ self new initializeFrom: tailPositions; yourself 
]

{ #category : 'accessing' }
AoCSnakeVisualization >> addGridPoint: aPoint [
	|aShape|
	aShape := self baseShape copy.
	aShape position: (self gridPosition: aPoint).
	aShape text: '.'.
	self canvas add: aShape
]

{ #category : 'accessing' }
AoCSnakeVisualization >> addHeadPoint: aPoint [
	|aShape aComposite|
	aShape := self baseShape copy.
	aShape color: Color lightGreen. 
	aShape text: 'H'.
	aComposite := RSComposite new.
	aComposite color: Color black.
	aComposite add: aShape.
	aComposite adjustToChildren.
	aComposite position: (self gridPosition: aPoint).
	self canvas add: aComposite.
	^ aComposite 
]

{ #category : 'accessing' }
AoCSnakeVisualization >> addMoveTo: aPoint at: index [
	|aShape transition|
	aShape := self shapes at: index.
	transition := self canvas transitionAnimation. 
	transition 
			duration: 0.05 seconds;
			when: RSAnimationStartEvent do: [ 
					aShape propertyAt: #fromPosition put: aShape position.
			];
			onStepDo: [:t | | from to |
					from := aShape propertyAt: #fromPosition.
					to := (self gridPosition: aPoint).
					aShape position: (from interpolateTo: to at: t)
			].
			"on: aShape set: #position:."
	self sequence add: transition.
]

{ #category : 'accessing' }
AoCSnakeVisualization >> addTailPoint: aPoint at: index [
	|aShape aComposite|
	aShape := self baseShape copy.
	aShape color: Color lightGreen. 
	aShape text: index asString.
	aComposite := RSComposite new.
	aComposite color: Color black.
	aComposite add: aShape.
	aComposite adjustToChildren.
	aComposite position: (self gridPosition: aPoint).
	self canvas add: aComposite.
	^ aComposite
]

{ #category : 'accessing' }
AoCSnakeVisualization >> addTailTracePoint: aPoint [
	|aShape aComposite|
	aShape := self baseShape copy.
	aShape color: Color red. 
	aShape text: 'x'.
	aComposite := RSComposite new.
	aComposite color: Color black.
	aComposite add: aShape.
	aComposite adjustToChildren.
	aComposite position: (self gridPosition: aPoint).
	self canvas add: aComposite.
	^ aComposite
]

{ #category : 'accessing' }
AoCSnakeVisualization >> addTailTraceTo: aPoint [
	| transition |
	
	transition := self canvas transitionAnimation. 
	transition 
			duration: 0.01 seconds;
			when: RSAnimationStartEvent do: [ 
				self addTailTracePoint: aPoint.
			].
	self sequence add: transition.
]

{ #category : 'accessing' }
AoCSnakeVisualization >> announcer [

	^ announcer
]

{ #category : 'accessing' }
AoCSnakeVisualization >> announcer: anObject [

	announcer := anObject
]

{ #category : 'accessing' }
AoCSnakeVisualization >> baseShape [

	^ baseShape ifNil: [ baseShape :=
		RSLabel new
   		 text: 'W';
	    color: 'green';
 	  	 fontName: 'Source Code Pro';
  		 yourself
	]
]

{ #category : 'accessing' }
AoCSnakeVisualization >> canvas [

	^ canvas
]

{ #category : 'accessing' }
AoCSnakeVisualization >> canvas: anObject [

	canvas := anObject
]

{ #category : 'accessing' }
AoCSnakeVisualization >> grid [

	^ grid
]

{ #category : 'accessing' }
AoCSnakeVisualization >> grid: anObject [

	grid := anObject
]

{ #category : 'accessing' }
AoCSnakeVisualization >> gridPoint: aPoint [
	|aShape|
	aShape := self baseShape copy.
	aShape position: (self gridPosition: aPoint).
	aShape text: '.'.
	^ aShape
]

{ #category : 'accessing' }
AoCSnakeVisualization >> gridPosition: aPoint [

	^ ((aPoint x) * (self baseShape width)) @ ((aPoint y * self baseShape height * (-1)))
]

{ #category : 'initialization' }
AoCSnakeVisualization >> initializeAnnouncer [

	self announcer: self model class announcer.
	self announcer when: NodePositionChanged send: #updatePosition: to: self.
	self announcer when: TailNodeChanged send: #traceTail: to: self.
]

{ #category : 'initialization' }
AoCSnakeVisualization >> initializeCanvas [

	self canvas: RSCanvas new.
	self canvas @ RSCanvasController.
	self canvas color: Color black.
]

{ #category : 'initialization' }
AoCSnakeVisualization >> initializeFrom: ropeTailObject [

	self initializeCanvas.
	self model: ropeTailObject.
	self initializeShapes.
	self initializeAnnouncer.
	self canvas zoomToFit.
	self sequence: self canvas sequentialAnimation.

]

{ #category : 'initialization' }
AoCSnakeVisualization >> initializeGridFrom: boundingRectangle [
	|aComposite|
	aComposite := RSComposite new.
	boundingRectangle origin x to: boundingRectangle corner x do: [: xDim | 
		boundingRectangle origin y to: boundingRectangle corner y do: [: yDim |
			aComposite add: (self gridPoint: xDim@yDim)			
		]
	].
	aComposite adjustToChildren.
	self canvas add: aComposite.
	self grid: aComposite.
]

{ #category : 'initialization' }
AoCSnakeVisualization >> initializeRopeFrom: tailPositions [

	self shapes add: (self addHeadPoint: tailPositions head).
	tailPositions tail withIndexDo: [:aPoint :idx|
		self shapes add: (self addTailPoint: aPoint at:idx). 
	].
	self shapes do: [:shape| self canvas pushBack: shape].
]

{ #category : 'initialization' }
AoCSnakeVisualization >> initializeShapes [

	self initializeGridFrom: self model boundingBoxOfRope.
	self shapes: OrderedCollection new.
	self initializeRopeFrom: self model. 
	self canvas pushBack: self grid.
]

{ #category : 'accessing' }
AoCSnakeVisualization >> model [

	^ model
]

{ #category : 'accessing' }
AoCSnakeVisualization >> model: anObject [

	model := anObject
]

{ #category : 'api actions' }
AoCSnakeVisualization >> open [

	self canvas open.
	self model compute.
	self canvas addAnimation: sequence.
]

{ #category : 'accessing' }
AoCSnakeVisualization >> sequence [

	^ sequence
]

{ #category : 'accessing' }
AoCSnakeVisualization >> sequence: anObject [

	sequence := anObject
]

{ #category : 'accessing' }
AoCSnakeVisualization >> shapes [

	^ shapes
]

{ #category : 'accessing' }
AoCSnakeVisualization >> shapes: anObject [

	shapes := anObject
]

{ #category : 'initialization' }
AoCSnakeVisualization >> traceTail: aTailNodeChanged [

	self addTailTraceTo:  aTailNodeChanged tailPoint
	
]

{ #category : 'initialization' }
AoCSnakeVisualization >> updatePosition: aNodepositionChanged [

	self addMoveTo: aNodepositionChanged newPosition at: aNodepositionChanged nodeIndex
	
]
