"
See chapter 3 of 'Pharo by Example'
"
Class {
	#name : #LOCell,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'mouseAction'
	],
	#category : #mypro1
}

{ #category : #initialization }
LOCell >> initialize [
	"comment stating purpose of instance-side message"

	"scope: class-variables  &  instance-variables"

	super initialize.
	self label: ''.
	self borderWidth: 2.
	bounds := 0 @ 0 corner: 32 @ 32.
	offColor := Color paleYellow.
	onColor := Color paleBlue darker.
	self useSquareCorners.
	self turnOff
]

{ #category : #'event handling' }
LOCell >> mouseAction: aBlock [
	mouseAction := aBlock
]

{ #category : #'event handling' }
LOCell >> mouseUp: anEvent [
	mouseAction value
]
