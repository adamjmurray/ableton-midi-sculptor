{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 67.0, 110.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"linecount" : 5,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 266.532623, 281.0, 147.0, 77.0 ],
					"style" : "",
					"text" : "window flags nomenu, window flags float, window flags nogrow, window size $1 $2 $3 $4, window exec, front"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 25.5, 87.0, 88.0, 20.0 ],
					"style" : "",
					"text" : "for developing"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-102",
					"linecount" : 4,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 25.5, 114.0, 123.0, 64.0 ],
					"presentation" : 1,
					"presentation_linecount" : 4,
					"presentation_rect" : [ 10.400024, 14.0, 123.0, 64.0 ],
					"style" : "",
					"text" : "window flags menu, window flags nofloat, window flags grow, window exec"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 496.0, 146.0, 150.0, 89.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 119.400024, 141.0, 317.0, 48.0 ],
					"style" : "",
					"text" : "3. Select notes in the Clip to edit.\n\nIf no notes are selected, it acts like all notes are selected."
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-32",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 661.200012, 146.0, 55.799988, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 115.600037, 135.5, 320.799988, 58.5 ],
					"proportion" : 0.39,
					"rounded" : 16,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 502.0, 77.0, 150.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 119.400024, 91.0, 296.0, 20.0 ],
					"style" : "",
					"text" : "2. Select a MIDI clip in Session or Arrangement view."
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-30",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 671.200012, 82.5, 52.799988, 37.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 115.600037, 85.5, 295.0, 30.5 ],
					"proportion" : 0.39,
					"rounded" : 16,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 502.0, 28.0, 150.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 119.400024, 46.0, 178.0, 20.0 ],
					"style" : "",
					"text" : "1. Open this device's Clip Editor"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.287863, 0.333333, 0.329398, 0.0 ],
					"bubble" : 1,
					"bubblepoint" : 0.3,
					"bubbleside" : 0,
					"bubbletextmargin" : 10,
					"id" : "obj-20",
					"linecount" : 8,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 475.200012, 542.0, 154.0, 146.0 ],
					"presentation" : 1,
					"presentation_linecount" : 6,
					"presentation_rect" : [ 135.200012, 420.0, 197.0, 118.0 ],
					"style" : "",
					"text" : "Spread the parameter values further apart or closer together.\n\nIf all values are the same, this has no effect. If nothing happens, try randomizing first."
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.279348, 0.29304, 0.244776, 0.0 ],
					"bubble" : 1,
					"bubblepoint" : 0.0,
					"bubbletextmargin" : 10,
					"id" : "obj-19",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 661.200012, 548.0, 155.0, 117.0 ],
					"presentation" : 1,
					"presentation_linecount" : 5,
					"presentation_rect" : [ 337.700012, 401.0, 238.0, 89.0 ],
					"style" : "",
					"text" : "Change randomly.\n\nEach time you life the mouse, this x-y pad is re-randomized (it gives different results each time you use it)."
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.287863, 0.333333, 0.329398, 0.0 ],
					"bubble" : 1,
					"bubblepoint" : 0.0,
					"bubbleside" : 3,
					"bubbletextmargin" : 10,
					"id" : "obj-18",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 264.200012, 542.0, 169.0, 48.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 7.400024, 401.0, 124.0, 48.0 ],
					"style" : "",
					"text" : "Change by a uniform amount."
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbletextmargin" : 10,
					"id" : "obj-16",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 475.200012, 419.0, 150.0, 103.0 ],
					"presentation" : 1,
					"presentation_linecount" : 4,
					"presentation_rect" : [ 357.400024, 294.0, 228.0, 76.0 ],
					"style" : "",
					"text" : "6. Edit the clip with these controls.\n\nEach time you lift the mouse, a new undo point is created."
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 3,
					"bubbletextmargin" : 10,
					"id" : "obj-12",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 484.0, 318.0, 150.0, 76.0 ],
					"presentation" : 1,
					"presentation_linecount" : 4,
					"presentation_rect" : [ 10.400024, 229.0, 122.0, 76.0 ],
					"style" : "",
					"text" : "5. Choose a max range that the parameter will change by."
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbletextmargin" : 10,
					"id" : "obj-11",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 488.0, 251.0, 150.0, 89.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 342.200012, 210.0, 212.0, 62.0 ],
					"style" : "",
					"text" : "4. Choose a parameter to edit.\n\n\"start\" is the note start time."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 12.0, 389.0, 225.615967, 215.0 ],
					"pic" : "midi-clip-variator.png",
					"presentation" : 1,
					"presentation_rect" : [ 122.400024, 219.0, 238.0, 209.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 305.615997, 143.0, 38.0, 22.0 ],
					"style" : "",
					"text" : "- 450"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 267.115997, 143.0, 31.0, 22.0 ],
					"style" : "",
					"text" : "- 80"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 384.532715, 199.0, 41.0, 22.0 ],
					"style" : "",
					"text" : "+ 550"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 332.699371, 199.0, 41.0, 22.0 ],
					"style" : "",
					"text" : "+ 600"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 266.69931, 199.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "t i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 266.532623, 239.0, 136.250122, 22.0 ],
					"style" : "",
					"text" : "pack i i i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 228.615967, 68.0, 24.0, 22.0 ],
					"style" : "",
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "int", "int", "int", "int", "int" ],
					"patching_rect" : [ 228.615967, 102.0, 173.000061, 22.0 ],
					"style" : "",
					"text" : "mousestate"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 14.0,
					"id" : "obj-5",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.0, 19.0, 78.0, 39.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 517.400024, 1.0, 88.0, 23.0 ],
					"style" : "",
					"text" : "version 1.1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 265.615967, 31.0, 61.0, 34.0 ],
					"style" : "",
					"text" : "open this window"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 267.115997, 369.5, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-1",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 228.615967, 21.0, 34.0, 34.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 14.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 134.0, 19.0, 78.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 115.600037, 5.0, 74.0, 23.0 ],
					"style" : "",
					"text" : "USAGE",
					"underline" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"id" : "obj-25",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 115.0, 481.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 119.400024, 216.0, 235.0, 214.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 670.0, 21.75, 47.0, 35.5 ],
					"presentation" : 1,
					"presentation_rect" : [ 115.600037, 40.5, 188.0, 30.5 ],
					"proportion" : 0.39,
					"rounded" : 16,
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-2", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"order" : 1,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 3 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"order" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"order" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
