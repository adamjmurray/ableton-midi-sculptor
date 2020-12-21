{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 329.0, 188.0, 972.0, 446.0 ],
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
					"id" : "obj-12",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 639.0, 21.0, 150.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.0, 119.0, 17.0, 18.0 ],
					"text" : "/",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 612.5, 163.0, 86.0, 22.0 ],
					"text" : "prepend strum"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 612.5, 111.0, 129.0, 22.0 ],
					"text" : "covert-to-beats"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 612.5, 44.0, 103.5, 20.0 ],
					"text" : "strum range"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in duration with each use of the controls below.\n\nThis value is the type of note: 4 is a quarter note, 8 is an eighth note, 16 is a 16th note, etc. This duration is multiplied by the previous value. So if this box shows 4 and the one to the left shows 3, that's 3 quarter notes.",
					"annotation_name" : "Strum Range",
					"id" : "obj-16",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 667.0, 66.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 35.0, 120.0, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "live.menu",
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_type" : 2,
							"parameter_annotation_name" : "Strum Range",
							"parameter_longname" : "live.menu[1]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_mmax" : 7,
							"parameter_initial" : [ 2.0 ]
						}

					}
,
					"varname" : "live.menu[1]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in duration with each use of the controls below.\n\nThis value is multipled by the duration set by the next value, where /4 is a quarter note, /8 is an eighth note, etc. So if this box shows 3 and the one to the right shows 4, that's 3 quarter notes.",
					"annotation_name" : "Strum Range",
					"id" : "obj-17",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 612.5, 66.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 120.0, 27.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_speedlim" : 5.0,
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_annotation_name" : "Strum Range",
							"parameter_mmin" : 1.0,
							"parameter_longname" : "velocity range[1]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_mmax" : 128.0,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "velrange[4]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in duration with each use of the controls below.\n\nThis toggles triplet time.",
					"annotation_name" : "Strum Range",
					"id" : "obj-23",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 722.5, 66.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 120.0, 39.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "live.text[2]",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_type" : 2,
							"parameter_annotation_name" : "Strum Range",
							"parameter_longname" : "live.text[1]",
							"parameter_invisible" : 2,
							"parameter_mmax" : 1
						}

					}
,
					"text" : "Triplet",
					"texton" : "Triplet",
					"varname" : "live.text[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 29.0, 8.0, 150.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.0, -1.0, 17.0, 18.0 ],
					"text" : "/",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 427.0, 17.0, 150.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.0, 89.0, 17.0, 18.0 ],
					"text" : "/",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.5, 159.0, 101.0, 22.0 ],
					"text" : "prepend duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 286.0, 159.0, 98.0, 22.0 ],
					"text" : "prepend velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 182.5, 159.0, 83.0, 22.0 ],
					"text" : "prepend pitch"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.5, 159.0, 81.0, 22.0 ],
					"text" : "prepend start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.5, 107.0, 129.0, 22.0 ],
					"text" : "covert-to-beats"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.5, 107.0, 129.0, 22.0 ],
					"text" : "covert-to-beats"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 235.5, 253.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.5, 40.0, 60.0, 20.0 ],
					"text" : "duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.0, 40.0, 60.0, 20.0 ],
					"text" : "velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 182.5, 40.0, 45.0, 20.0 ],
					"text" : "pitch"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 18.5, 40.0, 45.0, 20.0 ],
					"text" : "start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 35.0, 293.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
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
					"patching_rect" : [ 35.0, 233.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in duration with each use of the controls below.\n\nThis value is the type of note: 4 is a quarter note, 8 is an eighth note, 16 is a 16th note, etc. This duration is multiplied by the previous value. So if this box shows 4 and the one to the left shows 3, that's 3 quarter notes.",
					"annotation_name" : "Duration Range",
					"id" : "obj-134",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 455.0, 62.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 35.0, 90.0, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "live.menu",
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_type" : 2,
							"parameter_annotation_name" : "Duration Range",
							"parameter_longname" : "live.menu[11]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_mmax" : 7,
							"parameter_initial" : [ 2.0 ]
						}

					}
,
					"varname" : "live.menu[2]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in duration with each use of the controls below.\n\nThis value is multipled by the duration set by the next value, where /4 is a quarter note, /8 is an eighth note, etc. So if this box shows 3 and the one to the right shows 4, that's 3 quarter notes.",
					"annotation_name" : "Duration Range",
					"id" : "obj-135",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 400.5, 62.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 90.0, 27.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_speedlim" : 5.0,
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_annotation_name" : "Duration Range",
							"parameter_mmin" : 1.0,
							"parameter_longname" : "velocity range[17]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_mmax" : 128.0,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "velrange[1]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in start time with each use of the controls below.\n\nThis value is the type of note: 4 is a quarter note, 8 is an eighth note, 16 is a 16th note, etc. This duration is multiplied by the previous value. So if this box shows 4 and the one to the left shows 3, that's 3 quarter notes.",
					"annotation_name" : "Start Time Range",
					"id" : "obj-131",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 73.0, 62.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 35.0, 0.0, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "live.menu",
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_type" : 2,
							"parameter_annotation_name" : "Start Time Range",
							"parameter_longname" : "live.menu[10]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_mmax" : 7,
							"parameter_initial" : [ 2.0 ]
						}

					}
,
					"varname" : "live.menu[7]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in start time with each use of the controls below.\n\nThis value is multipled by the duration set by the next value, where /4 is a quarter note, /8 is an eighth note, etc. So if this box shows 3 and the one to the right shows 4, that's 3 quarter notes.",
					"annotation_name" : "Start Time Range",
					"id" : "obj-132",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 18.5, 62.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 27.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_speedlim" : 5.0,
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_annotation_name" : "Start Time Range",
							"parameter_mmin" : 1.0,
							"parameter_longname" : "velocity range[16]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_mmax" : 128.0,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "velrange[3]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in duration with each use of the controls below.\n\nThis toggles triplet time.",
					"annotation_name" : "Duration Range",
					"id" : "obj-107",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 510.5, 62.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 90.0, 39.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "live.text[2]",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_type" : 2,
							"parameter_annotation_name" : "Duration Range",
							"parameter_longname" : "live.text[14]",
							"parameter_invisible" : 2,
							"parameter_mmax" : 1
						}

					}
,
					"text" : "Triplet",
					"texton" : "Triplet",
					"varname" : "live.text[9]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in start time with each use of the controls below.\n\nThis toggles triplet time.",
					"annotation_name" : "Start Time Range",
					"id" : "obj-98",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 128.5, 62.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 0.0, 39.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "live.text[2]",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_type" : 2,
							"parameter_annotation_name" : "Start Time Range",
							"parameter_longname" : "live.text[11]",
							"parameter_invisible" : 2,
							"parameter_mmax" : 1
						}

					}
,
					"text" : "Triplet",
					"texton" : "Triplet",
					"varname" : "live.text[8]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in pitch with each use of the controls below.",
					"annotation_name" : "Pitch Range",
					"id" : "obj-50",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 182.5, 62.0, 41.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 30.0, 41.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_speedlim" : 5.0,
							"parameter_shortname" : "pitchrange",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_annotation_name" : "Pitch Range",
							"parameter_mmin" : 1.0,
							"parameter_longname" : "pitchrange",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_initial" : [ 12 ]
						}

					}
,
					"varname" : "velrange[2]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The maximum change in velocity with each use of the controls below.",
					"annotation_name" : "Velocity Range",
					"id" : "obj-11",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 286.0, 62.0, 41.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 60.0, 41.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_speedlim" : 5.0,
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_annotation_name" : "Velocity Range",
							"parameter_mmin" : 1.0,
							"parameter_longname" : "velocity range[5]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_initial" : [ 64.0 ]
						}

					}
,
					"varname" : "velrange"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 2 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"source" : [ "obj-131", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"source" : [ "obj-134", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 1 ],
					"source" : [ "obj-16", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 2 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 2 ],
					"source" : [ "obj-98", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-131" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-11" : [ "velocity range[5]", "velrange", 0 ],
			"obj-134" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-107" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-16" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-50" : [ "pitchrange", "pitchrange", 0 ],
			"obj-132" : [ "velocity range[16]", "velrange", 0 ],
			"obj-17" : [ "velocity range[1]", "velrange", 0 ],
			"obj-23" : [ "live.text[1]", "live.text[2]", 0 ],
			"obj-135" : [ "velocity range[17]", "velrange", 0 ],
			"obj-98" : [ "live.text[11]", "live.text[2]", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "covert-to-beats.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
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
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
					"fontsize" : [ 12.059008 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
