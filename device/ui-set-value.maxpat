{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 9,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 578.0, 226.0, 1000.0, 483.0 ],
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
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 862.199951000000056, 231.0, 39.0, 22.0 ],
					"text" : "/ 100."
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The probability to set.",
					"annotation_name" : "Set Probability",
					"id" : "obj-9",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 862.199951000000056, 202.0, 42.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 210.0, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Probability",
							"parameter_enum" : [ "0", "1" ],
							"parameter_info" : "The probability to set.",
							"parameter_initial" : [ 50 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "Set Velocity[3]",
							"parameter_mmax" : 100.0,
							"parameter_shortname" : "Set Velocity",
							"parameter_speedlim" : 5.0,
							"parameter_type" : 1,
							"parameter_unitstyle" : 5
						}

					}
,
					"varname" : "velrange[4]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The release velocity to set.",
					"annotation_name" : "Set Release Velocity",
					"id" : "obj-8",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 770.199951000000056, 202.0, 42.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 180.0, 30.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Release Velocity",
							"parameter_info" : "The release velocity to set.",
							"parameter_initial" : [ 64.0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "Set Velocity[2]",
							"parameter_shortname" : "Set Velocity",
							"parameter_speedlim" : 5.0,
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "velrange[3]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The velocity range to set.",
					"annotation_name" : "Set Velocity Range",
					"id" : "obj-7",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 679.199951000000056, 202.0, 42.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 150.0, 30.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Velocity Range",
							"parameter_info" : "The velocity range to set.",
							"parameter_initial" : [ 64 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "Set Velocity[1]",
							"parameter_mmin" : -127.0,
							"parameter_shortname" : "Set Velocity",
							"parameter_speedlim" : 5.0,
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "velrange[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 9,
					"outlettype" : [ "", "", "", "", "", "", "", "", "" ],
					"patching_rect" : [ 318.699951000000056, 87.0, 358.0, 22.0 ],
					"text" : "route note start pitch velocity duration velrange release probability"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-16",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 318.699951000000056, 25.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-15",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 442.199951000000056, 397.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 488.199951000000056, 237.0, 132.0, 22.0 ],
					"text" : "covert-to-beats.maxpat"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 173.5, 245.0, 132.0, 22.0 ],
					"text" : "covert-to-beats.maxpat"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 52.699950999999999, 83.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-5",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.699950999999999, 25.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 524.516845999999987, 196.0, 17.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.0, 119.0, 17.0, 18.0 ],
					"text" : "/",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The duration to set.\n\nThis value is the type of note: 4 is a quarter note, 8 is an eighth note, 16 is a 16th note, etc. This duration is multiplied by the previous value. So if this box shows 4 and the one to the left shows 3, that's 3 quarter notes from the start of the clip.",
					"annotation_name" : "Set Duration",
					"id" : "obj-2",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 539.699951000000056, 198.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 35.0, 120.0, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Duration",
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_initial" : [ 2 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "live.menu[1]",
							"parameter_mmax" : 7,
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2
						}

					}
,
					"varname" : "live.menu[1]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The duration to set.\n\nThis value is multipled by the duration set by the next value, where /4 is a quarter note, /8 is an eighth note, etc. So if this box shows 3 and the one to the right shows 4, that's 3 quarter notes from the start of the measure.",
					"annotation_name" : "Set Duration",
					"id" : "obj-3",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 488.199951000000056, 198.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 120.0, 27.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Duration",
							"parameter_initial" : [ 1.0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "velocity range[1]",
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_shortname" : "velrange",
							"parameter_speedlim" : 5.0,
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "velrange[1]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The duration to set.\n\nThis toggles triplet time.",
					"annotation_name" : "Set Duration",
					"id" : "obj-4",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 587.449951000000056, 198.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 120.0, 39.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Duration",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2,
							"parameter_longname" : "live.text[1]",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2
						}

					}
,
					"text" : "Triplet",
					"texton" : "Triplet",
					"varname" : "Set"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Delete, mute, or unmute notes.",
					"annotation_name" : "Mute or Delete Notes",
					"id" : "obj-201",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 46.199950999999999, 225.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 65.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Mute or Delete Notes",
							"parameter_enum" : [ "Deleted", "Muted", "Unmuted" ],
							"parameter_initial" : [ 1.0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "Mute or Delete Notes",
							"parameter_mmax" : 2,
							"parameter_shortname" : "Mute or Delete Notes",
							"parameter_type" : 2
						}

					}
,
					"varname" : "live.menu[16]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-196",
					"maxclass" : "live.comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 211.5, 201.0, 18.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.0, 29.0, 17.0, 18.0 ],
					"text" : "/",
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The start time to set.\n\nThis value is the type of note: 4 is a quarter note, 8 is an eighth note, 16 is a 16th note, etc. This duration is multiplied by the previous value. So if this box shows 4 and the one to the left shows 3, that's 3 quarter notes from the start of the clip.",
					"annotation_name" : "Set Start Time",
					"id" : "obj-197",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 225.0, 202.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 35.0, 30.0, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Start Time",
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_initial" : [ 2 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "live.menu[20]",
							"parameter_mmax" : 7,
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2
						}

					}
,
					"varname" : "live.menu[15]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The start time to set.\n\nThis value is multipled by the duration set by the next value, where /4 is a quarter note, /8 is an eighth note, etc. So if this box shows 3 and the one to the right shows 4, that's 3 quarter notes from the start of the clip.",
					"annotation_name" : "Set Start Time",
					"id" : "obj-198",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 173.5, 202.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 30.0, 27.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Start Time",
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "velocity range[24]",
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "velrange",
							"parameter_speedlim" : 5.0,
							"parameter_steps" : 256,
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "velrange[15]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The start time to set.\n\nThis toggles triplet time.",
					"annotation_name" : "Set Start Time",
					"id" : "obj-199",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 272.75, 202.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 30.0, 39.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Start Time",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2,
							"parameter_longname" : "live.text[23]",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2
						}

					}
,
					"text" : "Triplet",
					"texton" : "Triplet",
					"varname" : "Set Start Time"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The pitch to set.",
					"annotation_name" : "Set Pitch",
					"id" : "obj-194",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 343.074951000000112, 202.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 60.0, 32.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Pitch",
							"parameter_initial" : [ 60 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "Set Pitch",
							"parameter_mmin" : 1.0,
							"parameter_shortname" : "Set Pitch",
							"parameter_speedlim" : 5.0,
							"parameter_type" : 1,
							"parameter_unitstyle" : 8
						}

					}
,
					"varname" : "Set Pitch"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The velocity to set.",
					"annotation_name" : "Set Velocity",
					"id" : "obj-192",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 416.199951000000056, 202.0, 42.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 90.0, 30.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_annotation_name" : "Set Velocity",
							"parameter_initial" : [ 64.0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_longname" : "Set Velocity",
							"parameter_mmin" : 1.0,
							"parameter_shortname" : "Set Velocity",
							"parameter_speedlim" : 5.0,
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "velrange[13]"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-192", 0 ],
					"source" : [ "obj-17", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-194", 0 ],
					"source" : [ "obj-17", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-201", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-17", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-17", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-17", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-17", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-192", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-194", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-197", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-198", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"source" : [ "obj-199", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 1 ],
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-201", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 2 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-192" : [ "Set Velocity", "Set Velocity", 0 ],
			"obj-194" : [ "Set Pitch", "Set Pitch", 0 ],
			"obj-197" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-198" : [ "velocity range[24]", "velrange", 0 ],
			"obj-199" : [ "live.text[23]", "live.text[2]", 0 ],
			"obj-2" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-201" : [ "Mute or Delete Notes", "Mute or Delete Notes", 0 ],
			"obj-3" : [ "velocity range[1]", "velrange", 0 ],
			"obj-4" : [ "live.text[1]", "live.text[2]", 0 ],
			"obj-7" : [ "Set Velocity[1]", "Set Velocity", 0 ],
			"obj-8" : [ "Set Velocity[2]", "Set Velocity", 0 ],
			"obj-9" : [ "Set Velocity[3]", "Set Velocity", 0 ],
			"parameterbanks" : 			{

			}
,
			"inherited_shortname" : 1
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
