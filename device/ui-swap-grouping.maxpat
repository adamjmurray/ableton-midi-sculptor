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
		"rect" : [ 739.0, 621.0, 750.0, 457.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 6.0, 6.0 ],
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
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 375.0, 309.0, 57.0, 22.0 ],
					"style" : "",
					"text" : "pak 1. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 375.0, 345.0, 81.0, 22.0 ],
					"style" : "",
					"text" : "prepend time"
				}

			}
, 			{
				"box" : 				{
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 413.0, 214.0, 44.0, 58.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 131.0, 199.5, 44.0, 58.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "offset",
							"parameter_shortname" : "offset",
							"parameter_type" : 0,
							"parameter_mmin" : -0.5,
							"parameter_mmax" : 0.5,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0 ],
							"parameter_unitstyle" : 5,
							"parameter_invisible" : 2
						}

					}
,
					"triangle" : 1,
					"varname" : "live.dial"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 174.0, 302.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "prepend notes"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 118.0, 183.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "pak i s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 174.0, 267.0, 40.0, 22.0 ],
					"style" : "",
					"text" : "zl reg"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 284.0, 267.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "all"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-18",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 284.0, 392.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 287.0, 20.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 375.0, 267.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "float"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 375.0, 176.0, 115.0, 22.0 ],
					"style" : "",
					"text" : "covert-to-beats"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 447.0, 81.0, 87.0, 20.0 ],
					"style" : "",
					"text" : "time groups"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 107.0, 89.0, 76.0, 20.0 ],
					"style" : "",
					"text" : "note groups"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 253.0, 214.0, 112.0, 22.0 ],
					"style" : "",
					"text" : "route notes all time"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 253.0, 162.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-7",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 45.0, 285.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 45.0, 337.0, 100.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 372.0, 114.0, 46.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ -3.0, 207.0, 46.0, 20.0 ],
					"style" : "",
					"text" : "Size"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-172",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 118.0, 143.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 125.0, 39.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[11]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 2.0,
							"parameter_mmax" : 128.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[11]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 16.0,
					"id" : "obj-166",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 408.0, 130.0, 25.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 33.0, 223.0, 25.0, 25.0 ],
					"style" : "",
					"text" : "/",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-167",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 428.0, 132.0, 36.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 53.0, 225.0, 36.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[15]",
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2.0 ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[10]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-168",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 375.0, 132.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 225.0, 39.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[10]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 128.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[10]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-169",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 471.0, 132.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 225.0, 39.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[13]",
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0 ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "triplet",
					"texton" : "triplet",
					"varname" : "live.text[6]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-165",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 115.0, 125.0, 46.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ -3.0, 107.0, 46.0, 20.0 ],
					"style" : "",
					"text" : "Size"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-164",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 186.0, 143.0, 43.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 92.0, 125.0, 43.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[14]",
							"parameter_shortname" : "live.menu[5]",
							"parameter_type" : 2,
							"parameter_enum" : [ "new", "last", "first", "any" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[8]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-163",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 183.0, 125.0, 54.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 107.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "Extras"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-14", 0 ]
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
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 1 ],
					"source" : [ "obj-164", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"source" : [ "obj-167", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 2 ],
					"source" : [ "obj-169", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-164", 0 ],
					"order" : 2,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-167", 0 ],
					"order" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-168", 0 ],
					"order" : 1,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-172", 0 ],
					"order" : 3,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-4", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-4", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-168" : [ "velocity range[10]", "velrange", 0 ],
			"obj-164" : [ "live.menu[14]", "live.menu[5]", 0 ],
			"obj-169" : [ "live.text[13]", "live.text[2]", 0 ],
			"obj-5" : [ "offset", "offset", 0 ],
			"obj-167" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-172" : [ "velocity range[11]", "velrange", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "covert-to-beats.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
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
