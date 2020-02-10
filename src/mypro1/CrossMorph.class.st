"
Pharo By Example: Morph 
"
Class {
	#name : #CrossMorph,
	#superclass : #Morph,
	#instVars : [
		'isStepping'
	],
	#category : #mypro1
}

{ #category : #'geometry testing' }
CrossMorph >> containsPoint:	aPoint [
	^ (self horizontalBar containsPoint: aPoint) or: [ self verticalBar containsPoint: aPoint ]
]

{ #category : #drawing }
CrossMorph >> drawOn: aCanvas [
	| topAndBottom |
	aCanvas fillRectangle: self horizontalBar color: self color.
	topAndBottom := self verticalBar areasOutside: self horizontalBar.
	topAndBottom
		do: [ :each | aCanvas fillRectangle: each color: self color ]
]

{ #category : #'event handling' }
CrossMorph >> handleKeystroke: anEvent [
	| keyValue |
	keyValue := anEvent keyValue.
	keyValue = 30
		ifTrue: [ self position: self position - (0 @ 1) ].	"up arrow"
	keyValue = 31
		ifTrue: [ self position: self position + (0 @ 1) ].	"down arrow"
	keyValue = 29
		ifTrue: [ self position: self position + (1 @ 0) ].	"right arrow"
	keyValue = 28
		ifTrue: [ self position: self position - (1 @ 0) ].	"left arrow"
	keyValue = $+ asciiValue
		ifTrue: [ self startStepping ].
	keyValue = $- asciiValue
		ifTrue: [ self stopStepping ].
	keyValue = $  asciiValue
		ifTrue: [ isStepping
				ifTrue: [ isStepping := false.
					self stopStepping ]
				ifFalse: [ isStepping := true.
					self startStepping ] ]
]

{ #category : #'event handling' }
CrossMorph >> handlesMouseDown: anEvent [
  ^ true
]

{ #category : #'event handling' }
CrossMorph >> handlesMouseOver: anEvent [
  ^ true
]

{ #category : #private }
CrossMorph >> horizontalBar [
	| crossHeight |
	crossHeight := (self height / 3.0) rounded.
	^ self bounds insetBy: 0 @ crossHeight 
]

{ #category : #initialization }
CrossMorph >> initialize [
	super initialize.
	isStepping := false.
	color := Color red.
	bounds := 0 @ 0 extent: 200 @ 200.
]

{ #category : #'event handling' }
CrossMorph >> mouseDown: anEvent [
	anEvent redButtonPressed
		ifTrue: [ self color: Color red ].	"click"
	anEvent yellowButtonPressed
		ifTrue: [ self color: Color yellow ].	"action-click"
	self changed
]

{ #category : #'event handling' }
CrossMorph >> mouseEnter: anEvent [
	anEvent hand newKeyboardFocus: self
]

{ #category : #'event handling' }
CrossMorph >> mouseLeave: anEvent [
	anEvent hand newKeyboardFocus: nil
]

{ #category : #'stepping and presenter' }
CrossMorph >> step [
	(self color diff: Color black) < 0.1
		ifTrue: [ self color: Color red ]
		ifFalse: [ self color: color darker ]
]

{ #category : #stepping }
CrossMorph >> stepTime [
	^ 100
]

{ #category : #private }
CrossMorph >> verticalBar [
	| crossWidth |
	crossWidth  := (self width / 3.0) rounded.
	^ self bounds insetBy: crossWidth @ 0
]

{ #category : #'dropping/grabbing' }
CrossMorph >> wantsDroppedMorph: aMorph event: anEvent [
	^ aMorph color = Color yellow 
		"and: [ super wantsDroppedMorph: aMorph event: anEvent ]"
]
