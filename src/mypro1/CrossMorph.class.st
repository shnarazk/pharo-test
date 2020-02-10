"
Pharo By Example: Morph 
"
Class {
	#name : #CrossMorph,
	#superclass : #Morph,
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

{ #category : #private }
CrossMorph >> horizontalBar [
	| crossHeight |
	crossHeight := (self height / 3.0) rounded.
	^ self bounds insetBy: 0 @ crossHeight 
]

{ #category : #private }
CrossMorph >> verticalBar [
	| crossWidth |
	crossWidth  := (self width / 3.0) rounded.
	^ self bounds insetBy: crossWidth @ 0
]
