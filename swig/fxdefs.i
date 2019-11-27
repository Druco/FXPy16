%module fxdefs

#include "fxdefs2.h"
/********************************  Definitions  ********************************/

// Truth values
#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif
#ifndef MAYBE
#define MAYBE 2
#endif
#ifndef NULL
#define NULL 0
#endif

/// Make int out of two shorts
#define MKUINT(l,h) ((((FX::FXuint)(l))&0xffff) | (((FX::FXuint)(h))<<16))

/// Make selector from message type and message id
#define FXSEL(type,id) ((((FX::FXuint)(id))&0xffff) | (((FX::FXuint)(type))<<16))

/// Get type from selector
#define FXSELTYPE(s) ((FX::FXushort)(((s)>>16)&0xffff))


// FOX System Defined Selector Types
enum FXSelType {
  SEL_NONE,
  SEL_KEYPRESS,                       // Key
  SEL_KEYRELEASE,
  SEL_LEFTBUTTONPRESS,                // Buttons
  SEL_LEFTBUTTONRELEASE,
  SEL_MIDDLEBUTTONPRESS,
  SEL_MIDDLEBUTTONRELEASE,
  SEL_RIGHTBUTTONPRESS,
  SEL_RIGHTBUTTONRELEASE,
  SEL_MOTION,                         // Mouse motion
  SEL_ENTER,
  SEL_LEAVE,
  SEL_FOCUSIN,
  SEL_FOCUSOUT,
  SEL_KEYMAP,
  SEL_UNGRABBED,                      // Lost the grab (Windows)
  SEL_PAINT,                          // Must repaint window
  SEL_CREATE,
  SEL_DESTROY,
  SEL_UNMAP,                            /// Window was hidden
  SEL_MAP,                              /// Window was shown
  SEL_CONFIGURE,                        /// Resize
  SEL_SELECTION_LOST,                   /// Widget lost selection
  SEL_SELECTION_GAINED,                 /// Widget gained selection
  SEL_SELECTION_REQUEST,                /// Inquire selection data
  SEL_RAISED,                           /// Window to top of stack
  SEL_LOWERED,                          /// Window to bottom of stack
  SEL_CLOSE,                            /// Close window
  SEL_DELETE,                           /// Delete window
  SEL_MINIMIZE,                         /// Iconified
  SEL_RESTORE,                          /// No longer iconified or maximized
  SEL_MAXIMIZE,                         /// Maximized
  SEL_UPDATE,                           /// GUI update
  SEL_COMMAND,                          /// GUI command
  SEL_CLICKED,                          /// Clicked
  SEL_DOUBLECLICKED,                    /// Double-clicked
  SEL_TRIPLECLICKED,                    /// Triple-clicked
  SEL_MOUSEWHEEL,                       /// Mouse wheel
  SEL_CHANGED,                          /// GUI has changed
  SEL_VERIFY,                           /// Verify change
  SEL_DESELECTED,                       /// Deselected
  SEL_SELECTED,                         /// Selected
  SEL_INSERTED,                         /// Inserted
  SEL_REPLACED,                         /// Replaced
  SEL_DELETED,                          /// Deleted
  SEL_OPENED,                           /// Opened
  SEL_CLOSED,                           /// Closed
  SEL_EXPANDED,                         /// Expanded
  SEL_COLLAPSED,                        /// Collapsed
  SEL_BEGINDRAG,                        /// Start a drag
  SEL_ENDDRAG,                          /// End a drag
  SEL_DRAGGED,                          /// Dragged
  SEL_LASSOED,                          /// Lassoed
  SEL_TIMEOUT,                          /// Timeout occurred
  SEL_SIGNAL,                           /// Signal received
  SEL_CLIPBOARD_LOST,                   /// Widget lost clipboard
  SEL_CLIPBOARD_GAINED,                 /// Widget gained clipboard
  SEL_CLIPBOARD_REQUEST,                /// Inquire clipboard data
  SEL_CHORE,                            /// Background chore
  SEL_FOCUS_SELF,                       /// Focus on widget itself
  SEL_FOCUS_RIGHT,                      /// Focus moved right
  SEL_FOCUS_LEFT,                       /// Focus moved left
  SEL_FOCUS_DOWN,                       /// Focus moved down
  SEL_FOCUS_UP,                         /// Focus moved up
  SEL_FOCUS_NEXT,                       /// Focus moved to next widget
  SEL_FOCUS_PREV,                       /// Focus moved to previous widget
  SEL_DND_ENTER,                        /// Drag action entering potential drop target
  SEL_DND_LEAVE,                        /// Drag action leaving potential drop target
  SEL_DND_DROP,                         /// Drop on drop target
  SEL_DND_MOTION,                       /// Drag position changed over potential drop target
  SEL_DND_REQUEST,                      /// Inquire drag and drop data
  SEL_IO_READ,                          /// Read activity on a pipe
  SEL_IO_WRITE,                         /// Write activity on a pipe
  SEL_IO_EXCEPT,                        /// Except activity on a pipe
  SEL_PICKED,                           /// Picked some location
  SEL_QUERY_TIP,                        /// Message inquiring about tooltip
  SEL_QUERY_HELP,                       /// Message inquiring about statusline help
  SEL_DOCKED,                           /// Toolbar docked
  SEL_FLOATED,                          /// Toolbar floated
  SEL_SESSION_NOTIFY,                   /// Session is about to close
  SEL_SESSION_CLOSED,                   /// Session is closed
  SEL_LAST
  };


/// FOX Keyboard and Button states
enum {
  SHIFTMASK        = 0x001,           /// Shift key is down
  CAPSLOCKMASK     = 0x002,           /// Caps Lock key is down
  CONTROLMASK      = 0x004,           /// Ctrl key is down
  ALTMASK          = 0x008,           /// Alt key is down
  METAMASK         = 0x040,           /// Meta key is down
  NUMLOCKMASK      = 0x010,           /// Num Lock key is down
  SCROLLLOCKMASK   = 0x0E0,           /// Scroll Lock key is down (seems to vary)
  LEFTBUTTONMASK   = 0x100,           /// Left mouse button is down
  MIDDLEBUTTONMASK = 0x200,           /// Middle mouse button is down
  RIGHTBUTTONMASK  = 0x400            /// Right mouse button is down
  };


/// FOX Mouse buttons
enum {
  LEFTBUTTON       = 1,
  MIDDLEBUTTON     = 2,
  RIGHTBUTTON      = 3
  };


/// FOX window crossing modes
enum {
  CROSSINGNORMAL,		     /// Normal crossing event
  CROSSINGGRAB,			     /// Crossing due to mouse grab
  CROSSINGUNGRAB		     /// Crossing due to mouse ungrab
  };


/// FOX window visibility modes
enum {
  VISIBILITYTOTAL,
  VISIBILITYPARTIAL,
  VISIBILITYNONE
  };


/// Options for fxfilematch
enum {
  FILEMATCH_FILE_NAME   = 1,        /// No wildcard can ever match `/'
  FILEMATCH_NOESCAPE    = 2,        /// Backslashes don't quote special chars
  FILEMATCH_PERIOD      = 4,        /// Leading `.' is matched only explicitly
  FILEMATCH_LEADING_DIR = 8,        /// Ignore `/...' after a match
  FILEMATCH_CASEFOLD    = 16        /// Compare without regard to case
  };


/// Drag and drop actions
enum FXDragAction {
  DRAG_REJECT  = 0,                 /// Reject all drop actions
  DRAG_ACCEPT  = 1,                 /// Accept any drop action
  DRAG_COPY    = 2,                 /// Copy
  DRAG_MOVE    = 3,                 /// Move
  DRAG_LINK    = 4,                 /// Link
  DRAG_PRIVATE = 5                  /// Private
  };


/// Origin of data
enum FXDNDOrigin {
  FROM_SELECTION  = 0,              /// Primary selection
  FROM_CLIPBOARD  = 1,              /// Clipboard
  FROM_DRAGNDROP  = 2               /// Drag and drop source
  };


/// Exponent display
enum FXExponent {
  EXP_NEVER=FALSE,                  /// Never use exponential notation
  EXP_ALWAYS=TRUE,                  /// Always use exponential notation
  EXP_AUTO=MAYBE                    /// Use exponential notation if needed
  };


/// Search modes for search/replace dialogs
enum {
  SEARCH_FORWARD      = 0,    /// Search forward (default)
  SEARCH_BACKWARD     = 1,    /// Search backward
  SEARCH_NOWRAP       = 0,    /// Don't wrap (default)
  SEARCH_WRAP         = 2,    /// Wrap around to start
  SEARCH_EXACT        = 0,    /// Exact match (default)
  SEARCH_IGNORECASE   = 4,    /// Ignore case
  SEARCH_REGEX        = 8,    /// Regular expression match
  SEARCH_PREFIX       = 16    /// Prefix of subject string
  };

/******************************* Key defs **************************************/

enum {

  // Void symbol
  KEY_VoidSymbol                    = 0,

  // Miscellaneous
  KEY_BackSpace                     = 0xFF08,
  KEY_Tab                           = 0xFF09,
  KEY_Linefeed                      = 0xFF0A,
  KEY_Clear                         = 0xFF0B,
  KEY_Return                        = 0xFF0D,
  KEY_Pause                         = 0xFF13,
  KEY_Scroll_Lock                   = 0xFF14,
  KEY_Sys_Req                       = 0xFF15,
  KEY_Escape                        = 0xFF1B,
  KEY_Delete                        = 0xFFFF,
  KEY_Multi_key                     = 0xFF20,

  // Japanese
  KEY_Kanji                         = 0xFF21,
  KEY_Muhenkan                      = 0xFF22,
  KEY_Henkan_Mode                   = 0xFF23,
  KEY_Henkan                        = 0xFF23,
  KEY_Romaji                        = 0xFF24,
  KEY_Hiragana                      = 0xFF25,
  KEY_Katakana                      = 0xFF26,
  KEY_Hiragana_Katakana             = 0xFF27,
  KEY_Zenkaku                       = 0xFF28,
  KEY_Hankaku                       = 0xFF29,
  KEY_Zenkaku_Hankaku               = 0xFF2A,
  KEY_Touroku                       = 0xFF2B,
  KEY_Massyo                        = 0xFF2C,
  KEY_Kana_Lock                     = 0xFF2D,
  KEY_Kana_Shift                    = 0xFF2E,
  KEY_Eisu_Shift                    = 0xFF2F,
  KEY_Eisu_toggle                   = 0xFF30,

  // Cursor
  KEY_Home                          = 0xFF50,
  KEY_Left                          = 0xFF51,
  KEY_Up                            = 0xFF52,
  KEY_Right                         = 0xFF53,
  KEY_Down                          = 0xFF54,
  KEY_Prior                         = 0xFF55,
  KEY_Page_Up                       = 0xFF55,
  KEY_Next                          = 0xFF56,
  KEY_Page_Down                     = 0xFF56,
  KEY_End                           = 0xFF57,
  KEY_Begin                         = 0xFF58,

  // Functions
  KEY_Select                        = 0xFF60,
  KEY_Print                         = 0xFF61,
  KEY_Execute                       = 0xFF62,
  KEY_Insert                        = 0xFF63,
  KEY_Undo                          = 0xFF65,
  KEY_Redo                          = 0xFF66,
  KEY_Menu                          = 0xFF67,
  KEY_Find                          = 0xFF68,
  KEY_Cancel                        = 0xFF69,
  KEY_Help                          = 0xFF6A,
  KEY_Break                         = 0xFF6B,
  KEY_Mode_switch                   = 0xFF7E,
  KEY_script_switch                 = 0xFF7E,
  KEY_Num_Lock                      = 0xFF7F,

  // Keypad
  KEY_KP_Space                      = 0xFF80,
  KEY_KP_Tab                        = 0xFF89,
  KEY_KP_Enter                      = 0xFF8D,
  KEY_KP_F1                         = 0xFF91,
  KEY_KP_F2                         = 0xFF92,
  KEY_KP_F3                         = 0xFF93,
  KEY_KP_F4                         = 0xFF94,
  KEY_KP_Home                       = 0xFF95,
  KEY_KP_Left                       = 0xFF96,
  KEY_KP_Up                         = 0xFF97,
  KEY_KP_Right                      = 0xFF98,
  KEY_KP_Down                       = 0xFF99,
  KEY_KP_Prior                      = 0xFF9A,
  KEY_KP_Page_Up                    = 0xFF9A,
  KEY_KP_Next                       = 0xFF9B,
  KEY_KP_Page_Down                  = 0xFF9B,
  KEY_KP_End                        = 0xFF9C,
  KEY_KP_Begin                      = 0xFF9D,
  KEY_KP_Insert                     = 0xFF9E,
  KEY_KP_Delete                     = 0xFF9F,
  KEY_KP_Equal                      = 0xFFBD,
  KEY_KP_Multiply                   = 0xFFAA,
  KEY_KP_Add                        = 0xFFAB,
  KEY_KP_Separator                  = 0xFFAC,
  KEY_KP_Subtract                   = 0xFFAD,
  KEY_KP_Decimal                    = 0xFFAE,
  KEY_KP_Divide                     = 0xFFAF,

  // Keypad numbers
  KEY_KP_0                          = 0xFFB0,
  KEY_KP_1                          = 0xFFB1,
  KEY_KP_2                          = 0xFFB2,
  KEY_KP_3                          = 0xFFB3,
  KEY_KP_4                          = 0xFFB4,
  KEY_KP_5                          = 0xFFB5,
  KEY_KP_6                          = 0xFFB6,
  KEY_KP_7                          = 0xFFB7,
  KEY_KP_8                          = 0xFFB8,
  KEY_KP_9                          = 0xFFB9,

  // Function keys
  KEY_F1                            = 0xFFBE,
  KEY_F2                            = 0xFFBF,
  KEY_F3                            = 0xFFC0,
  KEY_F4                            = 0xFFC1,
  KEY_F5                            = 0xFFC2,
  KEY_F6                            = 0xFFC3,
  KEY_F7                            = 0xFFC4,
  KEY_F8                            = 0xFFC5,
  KEY_F9                            = 0xFFC6,
  KEY_F10                           = 0xFFC7,
  KEY_F11                           = 0xFFC8,
  KEY_L1                            = 0xFFC8,
  KEY_F12                           = 0xFFC9,
  KEY_L2                            = 0xFFC9,
  KEY_F13                           = 0xFFCA,
  KEY_L3                            = 0xFFCA,
  KEY_F14                           = 0xFFCB,
  KEY_L4                            = 0xFFCB,
  KEY_F15                           = 0xFFCC,
  KEY_L5                            = 0xFFCC,
  KEY_F16                           = 0xFFCD,
  KEY_L6                            = 0xFFCD,
  KEY_F17                           = 0xFFCE,
  KEY_L7                            = 0xFFCE,
  KEY_F18                           = 0xFFCF,
  KEY_L8                            = 0xFFCF,
  KEY_F19                           = 0xFFD0,
  KEY_L9                            = 0xFFD0,
  KEY_F20                           = 0xFFD1,
  KEY_L10                           = 0xFFD1,
  KEY_F21                           = 0xFFD2,
  KEY_R1                            = 0xFFD2,
  KEY_F22                           = 0xFFD3,
  KEY_R2                            = 0xFFD3,
  KEY_F23                           = 0xFFD4,
  KEY_R3                            = 0xFFD4,
  KEY_F24                           = 0xFFD5,
  KEY_R4                            = 0xFFD5,
  KEY_F25                           = 0xFFD6,
  KEY_R5                            = 0xFFD6,
  KEY_F26                           = 0xFFD7,
  KEY_R6                            = 0xFFD7,
  KEY_F27                           = 0xFFD8,
  KEY_R7                            = 0xFFD8,
  KEY_F28                           = 0xFFD9,
  KEY_R8                            = 0xFFD9,
  KEY_F29                           = 0xFFDA,
  KEY_R9                            = 0xFFDA,
  KEY_F30                           = 0xFFDB,
  KEY_R10                           = 0xFFDB,
  KEY_F31                           = 0xFFDC,
  KEY_R11                           = 0xFFDC,
  KEY_F32                           = 0xFFDD,
  KEY_R12                           = 0xFFDD,
  KEY_F33                           = 0xFFDE,
  KEY_R13                           = 0xFFDE,
  KEY_F34                           = 0xFFDF,
  KEY_R14                           = 0xFFDF,
  KEY_F35                           = 0xFFE0,
  KEY_R15                           = 0xFFE0,

  // Modifiers
  KEY_Shift_L                       = 0xFFE1,
  KEY_Shift_R                       = 0xFFE2,
  KEY_Control_L                     = 0xFFE3,
  KEY_Control_R                     = 0xFFE4,
  KEY_Caps_Lock                     = 0xFFE5,
  KEY_Shift_Lock                    = 0xFFE6,

  KEY_Meta_L                        = 0xFFE7,
  KEY_Meta_R                        = 0xFFE8,
  KEY_Alt_L                         = 0xFFE9,
  KEY_Alt_R                         = 0xFFEA,
  KEY_Super_L                       = 0xFFEB,
  KEY_Super_R                       = 0xFFEC,
  KEY_Hyper_L                       = 0xFFED,
  KEY_Hyper_R                       = 0xFFEE,


  // ISO 9995
  KEY_ISO_Lock                      = 0xFE01,
  KEY_ISO_Level2_Latch              = 0xFE02,
  KEY_ISO_Level3_Shift              = 0xFE03,
  KEY_ISO_Level3_Latch              = 0xFE04,
  KEY_ISO_Level3_Lock               = 0xFE05,
  KEY_ISO_Group_Shift               = 0xFF7E,
  KEY_ISO_Group_Latch               = 0xFE06,
  KEY_ISO_Group_Lock                = 0xFE07,
  KEY_ISO_Next_Group                = 0xFE08,
  KEY_ISO_Next_Group_Lock           = 0xFE09,
  KEY_ISO_Prev_Group                = 0xFE0A,
  KEY_ISO_Prev_Group_Lock           = 0xFE0B,
  KEY_ISO_First_Group               = 0xFE0C,
  KEY_ISO_First_Group_Lock          = 0xFE0D,
  KEY_ISO_Last_Group                = 0xFE0E,
  KEY_ISO_Last_Group_Lock           = 0xFE0F,
  KEY_ISO_Left_Tab                  = 0xFE20,
  KEY_ISO_Move_Line_Up              = 0xFE21,
  KEY_ISO_Move_Line_Down            = 0xFE22,
  KEY_ISO_Partial_Line_Up           = 0xFE23,
  KEY_ISO_Partial_Line_Down         = 0xFE24,
  KEY_ISO_Partial_Space_Left        = 0xFE25,
  KEY_ISO_Partial_Space_Right       = 0xFE26,
  KEY_ISO_Set_Margin_Left           = 0xFE27,
  KEY_ISO_Set_Margin_Right          = 0xFE28,
  KEY_ISO_Release_Margin_Left       = 0xFE29,
  KEY_ISO_Release_Margin_Right      = 0xFE2A,
  KEY_ISO_Release_Both_Margins      = 0xFE2B,
  KEY_ISO_Fast_Cursor_Left          = 0xFE2C,
  KEY_ISO_Fast_Cursor_Right         = 0xFE2D,
  KEY_ISO_Fast_Cursor_Up            = 0xFE2E,
  KEY_ISO_Fast_Cursor_Down          = 0xFE2F,
  KEY_ISO_Continuous_Underline      = 0xFE30,
  KEY_ISO_Discontinuous_Underline   = 0xFE31,
  KEY_ISO_Emphasize                 = 0xFE32,
  KEY_ISO_Center_Object             = 0xFE33,
  KEY_ISO_Enter                     = 0xFE34,

  KEY_dead_grave                    = 0xFE50,
  KEY_dead_acute                    = 0xFE51,
  KEY_dead_circumflex               = 0xFE52,
  KEY_dead_tilde                    = 0xFE53,
  KEY_dead_macron                   = 0xFE54,
  KEY_dead_breve                    = 0xFE55,
  KEY_dead_abovedot                 = 0xFE56,
  KEY_dead_diaeresis                = 0xFE57,
  KEY_dead_abovering                = 0xFE58,
  KEY_dead_doubleacute              = 0xFE59,
  KEY_dead_caron                    = 0xFE5A,
  KEY_dead_cedilla                  = 0xFE5B,
  KEY_dead_ogonek                   = 0xFE5C,
  KEY_dead_iota                     = 0xFE5D,
  KEY_dead_voiced_sound             = 0xFE5E,
  KEY_dead_semivoiced_sound         = 0xFE5F,
  KEY_dead_belowdot                 = 0xFE60,

  KEY_First_Virtual_Screen          = 0xFED0,
  KEY_Prev_Virtual_Screen           = 0xFED1,
  KEY_Next_Virtual_Screen           = 0xFED2,
  KEY_Last_Virtual_Screen           = 0xFED4,
  KEY_Terminate_Server              = 0xFED5,

  KEY_AccessX_Enable                = 0xFE70,
  KEY_AccessX_Feedback_Enable       = 0xFE71,
  KEY_RepeatKeys_Enable             = 0xFE72,
  KEY_SlowKeys_Enable               = 0xFE73,
  KEY_BounceKeys_Enable             = 0xFE74,
  KEY_StickyKeys_Enable             = 0xFE75,
  KEY_MouseKeys_Enable              = 0xFE76,
  KEY_MouseKeys_Accel_Enable        = 0xFE77,
  KEY_Overlay1_Enable               = 0xFE78,
  KEY_Overlay2_Enable               = 0xFE79,
  KEY_AudibleBell_Enable            = 0xFE7A,

  KEY_Pointer_Left                  = 0xFEE0,
  KEY_Pointer_Right                 = 0xFEE1,
  KEY_Pointer_Up                    = 0xFEE2,
  KEY_Pointer_Down                  = 0xFEE3,
  KEY_Pointer_UpLeft                = 0xFEE4,
  KEY_Pointer_UpRight               = 0xFEE5,
  KEY_Pointer_DownLeft              = 0xFEE6,
  KEY_Pointer_DownRight             = 0xFEE7,
  KEY_Pointer_Button_Dflt           = 0xFEE8,
  KEY_Pointer_Button1               = 0xFEE9,
  KEY_Pointer_Button2               = 0xFEEA,
  KEY_Pointer_Button3               = 0xFEEB,
  KEY_Pointer_Button4               = 0xFEEC,
  KEY_Pointer_Button5               = 0xFEED,
  KEY_Pointer_DblClick_Dflt         = 0xFEEE,
  KEY_Pointer_DblClick1             = 0xFEEF,
  KEY_Pointer_DblClick2             = 0xFEF0,
  KEY_Pointer_DblClick3             = 0xFEF1,
  KEY_Pointer_DblClick4             = 0xFEF2,
  KEY_Pointer_DblClick5             = 0xFEF3,
  KEY_Pointer_Drag_Dflt             = 0xFEF4,
  KEY_Pointer_Drag1                 = 0xFEF5,
  KEY_Pointer_Drag2                 = 0xFEF6,
  KEY_Pointer_Drag3                 = 0xFEF7,
  KEY_Pointer_Drag4                 = 0xFEF8,
  KEY_Pointer_Drag5                 = 0xFEFD,

  KEY_Pointer_EnableKeys            = 0xFEF9,
  KEY_Pointer_Accelerate            = 0xFEFA,
  KEY_Pointer_DfltBtnNext           = 0xFEFB,
  KEY_Pointer_DfltBtnPrev           = 0xFEFC,

  // 3270 Terminal
  KEY_3270_Duplicate                = 0xFD01,
  KEY_3270_FieldMark                = 0xFD02,
  KEY_3270_Right2                   = 0xFD03,
  KEY_3270_Left2                    = 0xFD04,
  KEY_3270_BackTab                  = 0xFD05,
  KEY_3270_EraseEOF                 = 0xFD06,
  KEY_3270_EraseInput               = 0xFD07,
  KEY_3270_Reset                    = 0xFD08,
  KEY_3270_Quit                     = 0xFD09,
  KEY_3270_PA1                      = 0xFD0A,
  KEY_3270_PA2                      = 0xFD0B,
  KEY_3270_PA3                      = 0xFD0C,
  KEY_3270_Test                     = 0xFD0D,
  KEY_3270_Attn                     = 0xFD0E,
  KEY_3270_CursorBlink              = 0xFD0F,
  KEY_3270_AltCursor                = 0xFD10,
  KEY_3270_KeyClick                 = 0xFD11,
  KEY_3270_Jump                     = 0xFD12,
  KEY_3270_Ident                    = 0xFD13,
  KEY_3270_Rule                     = 0xFD14,
  KEY_3270_Copy                     = 0xFD15,
  KEY_3270_Play                     = 0xFD16,
  KEY_3270_Setup                    = 0xFD17,
  KEY_3270_Record                   = 0xFD18,
  KEY_3270_ChangeScreen             = 0xFD19,
  KEY_3270_DeleteWord               = 0xFD1A,
  KEY_3270_ExSelect                 = 0xFD1B,
  KEY_3270_CursorSelect             = 0xFD1C,
  KEY_3270_PrintScreen              = 0xFD1D,
  KEY_3270_Enter                    = 0xFD1E,

  // Latin 1
  KEY_space                         = 0x0020,
  KEY_exclam                        = 0x0021,
  KEY_quotedbl                      = 0x0022,
  KEY_numbersign                    = 0x0023,
  KEY_dollar                        = 0x0024,
  KEY_percent                       = 0x0025,
  KEY_ampersand                     = 0x0026,
  KEY_apostrophe                    = 0x0027,
  KEY_quoteright                    = 0x0027,
  KEY_parenleft                     = 0x0028,
  KEY_parenright                    = 0x0029,
  KEY_asterisk                      = 0x002A,
  KEY_plus                          = 0x002B,
  KEY_comma                         = 0x002C,
  KEY_minus                         = 0x002D,
  KEY_period                        = 0x002E,
  KEY_slash                         = 0x002F,
  KEY_0                             = 0x0030,
  KEY_1                             = 0x0031,
  KEY_2                             = 0x0032,
  KEY_3                             = 0x0033,
  KEY_4                             = 0x0034,
  KEY_5                             = 0x0035,
  KEY_6                             = 0x0036,
  KEY_7                             = 0x0037,
  KEY_8                             = 0x0038,
  KEY_9                             = 0x0039,
  KEY_colon                         = 0x003A,
  KEY_semicolon                     = 0x003B,
  KEY_less                          = 0x003C,
  KEY_equal                         = 0x003D,
  KEY_greater                       = 0x003E,
  KEY_question                      = 0x003F,
  KEY_at                            = 0x0040,
  KEY_A                             = 0x0041,
  KEY_B                             = 0x0042,
  KEY_C                             = 0x0043,
  KEY_D                             = 0x0044,
  KEY_E                             = 0x0045,
  KEY_F                             = 0x0046,
  KEY_G                             = 0x0047,
  KEY_H                             = 0x0048,
  KEY_I                             = 0x0049,
  KEY_J                             = 0x004A,
  KEY_K                             = 0x004B,
  KEY_L                             = 0x004C,
  KEY_M                             = 0x004D,
  KEY_N                             = 0x004E,
  KEY_O                             = 0x004F,
  KEY_P                             = 0x0050,
  KEY_Q                             = 0x0051,
  KEY_R                             = 0x0052,
  KEY_S                             = 0x0053,
  KEY_T                             = 0x0054,
  KEY_U                             = 0x0055,
  KEY_V                             = 0x0056,
  KEY_W                             = 0x0057,
  KEY_X                             = 0x0058,
  KEY_Y                             = 0x0059,
  KEY_Z                             = 0x005A,
  KEY_bracketleft                   = 0x005B,
  KEY_backslash                     = 0x005C,
  KEY_bracketright                  = 0x005D,
  KEY_asciicircum                   = 0x005E,
  KEY_underscore                    = 0x005F,
  KEY_grave                         = 0x0060,
  KEY_quoteleft                     = 0x0060,
  KEY_a                             = 0x0061,
  KEY_b                             = 0x0062,
  KEY_c                             = 0x0063,
  KEY_d                             = 0x0064,
  KEY_e                             = 0x0065,
  KEY_f                             = 0x0066,
  KEY_g                             = 0x0067,
  KEY_h                             = 0x0068,
  KEY_i                             = 0x0069,
  KEY_j                             = 0x006A,
  KEY_k                             = 0x006B,
  KEY_l                             = 0x006C,
  KEY_m                             = 0x006D,
  KEY_n                             = 0x006E,
  KEY_o                             = 0x006F,
  KEY_p                             = 0x0070,
  KEY_q                             = 0x0071,
  KEY_r                             = 0x0072,
  KEY_s                             = 0x0073,
  KEY_t                             = 0x0074,
  KEY_u                             = 0x0075,
  KEY_v                             = 0x0076,
  KEY_w                             = 0x0077,
  KEY_x                             = 0x0078,
  KEY_y                             = 0x0079,
  KEY_z                             = 0x007A,
  KEY_braceleft                     = 0x007B,
  KEY_bar                           = 0x007C,
  KEY_braceright                    = 0x007D,
  KEY_asciitilde                    = 0x007E,

  KEY_nobreakspace                  = 0x00A0,
  KEY_exclamdown                    = 0x00A1,
  KEY_cent                          = 0x00A2,
  KEY_sterling                      = 0x00A3,
  KEY_currency                      = 0x00A4,
  KEY_yen                           = 0x00A5,
  KEY_brokenbar                     = 0x00A6,
  KEY_section                       = 0x00A7,
  KEY_diaeresis                     = 0x00A8,
  KEY_copyright                     = 0x00A9,
  KEY_ordfeminine                   = 0x00AA,
  KEY_guillemotleft                 = 0x00AB,
  KEY_notsign                       = 0x00AC,
  KEY_hyphen                        = 0x00AD,
  KEY_registered                    = 0x00AE,
  KEY_macron                        = 0x00AF,
  KEY_degree                        = 0x00B0,
  KEY_plusminus                     = 0x00B1,
  KEY_twosuperior                   = 0x00B2,
  KEY_threesuperior                 = 0x00B3,
  KEY_acute                         = 0x00B4,
  KEY_mu                            = 0x00B5,
  KEY_paragraph                     = 0x00B6,
  KEY_periodcentered                = 0x00B7,
  KEY_cedilla                       = 0x00B8,
  KEY_onesuperior                   = 0x00B9,
  KEY_masculine                     = 0x00BA,
  KEY_guillemotright                = 0x00BB,
  KEY_onequarter                    = 0x00BC,
  KEY_onehalf                       = 0x00BD,
  KEY_threequarters                 = 0x00BE,
  KEY_questiondown                  = 0x00BF,
  KEY_Agrave                        = 0x00C0,
  KEY_Aacute                        = 0x00C1,
  KEY_Acircumflex                   = 0x00C2,
  KEY_Atilde                        = 0x00C3,
  KEY_Adiaeresis                    = 0x00C4,
  KEY_Aring                         = 0x00C5,
  KEY_AE                            = 0x00C6,
  KEY_Ccedilla                      = 0x00C7,
  KEY_Egrave                        = 0x00C8,
  KEY_Eacute                        = 0x00C9,
  KEY_Ecircumflex                   = 0x00CA,
  KEY_Ediaeresis                    = 0x00CB,
  KEY_Igrave                        = 0x00CC,
  KEY_Iacute                        = 0x00CD,
  KEY_Icircumflex                   = 0x00CE,
  KEY_Idiaeresis                    = 0x00CF,
  KEY_ETH                           = 0x00D0,
  KEY_Eth                           = 0x00D0,
  KEY_Ntilde                        = 0x00D1,
  KEY_Ograve                        = 0x00D2,
  KEY_Oacute                        = 0x00D3,
  KEY_Ocircumflex                   = 0x00D4,
  KEY_Otilde                        = 0x00D5,
  KEY_Odiaeresis                    = 0x00D6,
  KEY_multiply                      = 0x00D7,
  KEY_Ooblique                      = 0x00D8,
  KEY_Ugrave                        = 0x00D9,
  KEY_Uacute                        = 0x00DA,
  KEY_Ucircumflex                   = 0x00DB,
  KEY_Udiaeresis                    = 0x00DC,
  KEY_Yacute                        = 0x00DD,
  KEY_THORN                         = 0x00DE,
  KEY_Thorn                         = 0x00DE,
  KEY_ssharp                        = 0x00DF,
  KEY_agrave                        = 0x00E0,
  KEY_aacute                        = 0x00E1,
  KEY_acircumflex                   = 0x00E2,
  KEY_atilde                        = 0x00E3,
  KEY_adiaeresis                    = 0x00E4,
  KEY_aring                         = 0x00E5,
  KEY_ae                            = 0x00E6,
  KEY_ccedilla                      = 0x00E7,
  KEY_egrave                        = 0x00E8,
  KEY_eacute                        = 0x00E9,
  KEY_ecircumflex                   = 0x00EA,
  KEY_ediaeresis                    = 0x00EB,
  KEY_igrave                        = 0x00EC,
  KEY_iacute                        = 0x00ED,
  KEY_icircumflex                   = 0x00EE,
  KEY_idiaeresis                    = 0x00EF,
  KEY_eth                           = 0x00F0,
  KEY_ntilde                        = 0x00F1,
  KEY_ograve                        = 0x00F2,
  KEY_oacute                        = 0x00F3,
  KEY_ocircumflex                   = 0x00F4,
  KEY_otilde                        = 0x00F5,
  KEY_odiaeresis                    = 0x00F6,
  KEY_division                      = 0x00F7,
  KEY_oslash                        = 0x00F8,
  KEY_ugrave                        = 0x00F9,
  KEY_uacute                        = 0x00FA,
  KEY_ucircumflex                   = 0x00FB,
  KEY_udiaeresis                    = 0x00FC,
  KEY_yacute                        = 0x00FD,
  KEY_thorn                         = 0x00FE,
  KEY_ydiaeresis                    = 0x00FF,

  // Latin 2
  KEY_Aogonek                       = 0x01A1,
  KEY_breve                         = 0x01A2,
  KEY_Lstroke                       = 0x01A3,
  KEY_Lcaron                        = 0x01A5,
  KEY_Sacute                        = 0x01A6,
  KEY_Scaron                        = 0x01A9,
  KEY_Scedilla                      = 0x01AA,
  KEY_Tcaron                        = 0x01AB,
  KEY_Zacute                        = 0x01AC,
  KEY_Zcaron                        = 0x01AE,
  KEY_Zabovedot                     = 0x01AF,
  KEY_aogonek                       = 0x01B1,
  KEY_ogonek                        = 0x01B2,
  KEY_lstroke                       = 0x01B3,
  KEY_lcaron                        = 0x01B5,
  KEY_sacute                        = 0x01B6,
  KEY_caron                         = 0x01B7,
  KEY_scaron                        = 0x01B9,
  KEY_scedilla                      = 0x01BA,
  KEY_tcaron                        = 0x01BB,
  KEY_zacute                        = 0x01BC,
  KEY_doubleacute                   = 0x01BD,
  KEY_zcaron                        = 0x01BE,
  KEY_zabovedot                     = 0x01BF,
  KEY_Racute                        = 0x01C0,
  KEY_Abreve                        = 0x01C3,
  KEY_Lacute                        = 0x01C5,
  KEY_Cacute                        = 0x01C6,
  KEY_Ccaron                        = 0x01C8,
  KEY_Eogonek                       = 0x01CA,
  KEY_Ecaron                        = 0x01CC,
  KEY_Dcaron                        = 0x01CF,
  KEY_Dstroke                       = 0x01D0,
  KEY_Nacute                        = 0x01D1,
  KEY_Ncaron                        = 0x01D2,
  KEY_Odoubleacute                  = 0x01D5,
  KEY_Rcaron                        = 0x01D8,
  KEY_Uring                         = 0x01D9,
  KEY_Udoubleacute                  = 0x01DB,
  KEY_Tcedilla                      = 0x01DE,
  KEY_racute                        = 0x01E0,
  KEY_abreve                        = 0x01E3,
  KEY_lacute                        = 0x01E5,
  KEY_cacute                        = 0x01E6,
  KEY_ccaron                        = 0x01E8,
  KEY_eogonek                       = 0x01EA,
  KEY_ecaron                        = 0x01EC,
  KEY_dcaron                        = 0x01EF,
  KEY_dstroke                       = 0x01F0,
  KEY_nacute                        = 0x01F1,
  KEY_ncaron                        = 0x01F2,
  KEY_odoubleacute                  = 0x01F5,
  KEY_udoubleacute                  = 0x01FB,
  KEY_rcaron                        = 0x01F8,
  KEY_uring                         = 0x01F9,
  KEY_tcedilla                      = 0x01FE,
  KEY_abovedot                      = 0x01FF,

  // Latin 3
  KEY_Hstroke                       = 0x02A1,
  KEY_Hcircumflex                   = 0x02A6,
  KEY_Iabovedot                     = 0x02A9,
  KEY_Gbreve                        = 0x02AB,
  KEY_Jcircumflex                   = 0x02AC,
  KEY_hstroke                       = 0x02B1,
  KEY_hcircumflex                   = 0x02B6,
  KEY_idotless                      = 0x02B9,
  KEY_gbreve                        = 0x02BB,
  KEY_jcircumflex                   = 0x02BC,
  KEY_Cabovedot                     = 0x02C5,
  KEY_Ccircumflex                   = 0x02C6,
  KEY_Gabovedot                     = 0x02D5,
  KEY_Gcircumflex                   = 0x02D8,
  KEY_Ubreve                        = 0x02DD,
  KEY_Scircumflex                   = 0x02DE,
  KEY_cabovedot                     = 0x02E5,
  KEY_ccircumflex                   = 0x02E6,
  KEY_gabovedot                     = 0x02F5,
  KEY_gcircumflex                   = 0x02F8,
  KEY_ubreve                        = 0x02FD,
  KEY_scircumflex                   = 0x02FE,


  // Latin 4
  KEY_kra                           = 0x03A2,
  KEY_kappa                         = 0x03A2,
  KEY_Rcedilla                      = 0x03A3,
  KEY_Itilde                        = 0x03A5,
  KEY_Lcedilla                      = 0x03A6,
  KEY_Emacron                       = 0x03AA,
  KEY_Gcedilla                      = 0x03AB,
  KEY_Tslash                        = 0x03AC,
  KEY_rcedilla                      = 0x03B3,
  KEY_itilde                        = 0x03B5,
  KEY_lcedilla                      = 0x03B6,
  KEY_emacron                       = 0x03BA,
  KEY_gcedilla                      = 0x03BB,
  KEY_tslash                        = 0x03BC,
  KEY_ENG                           = 0x03BD,
  KEY_eng                           = 0x03BF,
  KEY_Amacron                       = 0x03C0,
  KEY_Iogonek                       = 0x03C7,
  KEY_Eabovedot                     = 0x03CC,
  KEY_Imacron                       = 0x03CF,
  KEY_Ncedilla                      = 0x03D1,
  KEY_Omacron                       = 0x03D2,
  KEY_Kcedilla                      = 0x03D3,
  KEY_Uogonek                       = 0x03D9,
  KEY_Utilde                        = 0x03DD,
  KEY_Umacron                       = 0x03DE,
  KEY_amacron                       = 0x03E0,
  KEY_iogonek                       = 0x03E7,
  KEY_eabovedot                     = 0x03EC,
  KEY_imacron                       = 0x03EF,
  KEY_ncedilla                      = 0x03F1,
  KEY_omacron                       = 0x03F2,
  KEY_kcedilla                      = 0x03F3,
  KEY_uogonek                       = 0x03F9,
  KEY_utilde                        = 0x03FD,
  KEY_umacron                       = 0x03FE,

  // Katakana
  KEY_overline                      = 0x047E,
  KEY_kana_fullstop                 = 0x04A1,
  KEY_kana_openingbracket           = 0x04A2,
  KEY_kana_closingbracket           = 0x04A3,
  KEY_kana_comma                    = 0x04A4,
  KEY_kana_conjunctive              = 0x04A5,
  KEY_kana_middledot                = 0x04A5,
  KEY_kana_WO                       = 0x04A6,
  KEY_kana_a                        = 0x04A7,
  KEY_kana_i                        = 0x04A8,
  KEY_kana_u                        = 0x04A9,
  KEY_kana_e                        = 0x04AA,
  KEY_kana_o                        = 0x04AB,
  KEY_kana_ya                       = 0x04AC,
  KEY_kana_yu                       = 0x04AD,
  KEY_kana_yo                       = 0x04AE,
  KEY_kana_tsu                      = 0x04AF,
  KEY_kana_tu                       = 0x04AF,
  KEY_prolongedsound                = 0x04B0,
  KEY_kana_A                        = 0x04B1,
  KEY_kana_I                        = 0x04B2,
  KEY_kana_U                        = 0x04B3,
  KEY_kana_E                        = 0x04B4,
  KEY_kana_O                        = 0x04B5,
  KEY_kana_KA                       = 0x04B6,
  KEY_kana_KI                       = 0x04B7,
  KEY_kana_KU                       = 0x04B8,
  KEY_kana_KE                       = 0x04B9,
  KEY_kana_KO                       = 0x04BA,
  KEY_kana_SA                       = 0x04BB,
  KEY_kana_SHI                      = 0x04BC,
  KEY_kana_SU                       = 0x04BD,
  KEY_kana_SE                       = 0x04BE,
  KEY_kana_SO                       = 0x04BF,
  KEY_kana_TA                       = 0x04C0,
  KEY_kana_CHI                      = 0x04C1,
  KEY_kana_TI                       = 0x04C1,
  KEY_kana_TSU                      = 0x04C2,
  KEY_kana_TU                       = 0x04C2,
  KEY_kana_TE                       = 0x04C3,
  KEY_kana_TO                       = 0x04C4,
  KEY_kana_NA                       = 0x04C5,
  KEY_kana_NI                       = 0x04C6,
  KEY_kana_NU                       = 0x04C7,
  KEY_kana_NE                       = 0x04C8,
  KEY_kana_NO                       = 0x04C9,
  KEY_kana_HA                       = 0x04CA,
  KEY_kana_HI                       = 0x04CB,
  KEY_kana_FU                       = 0x04CC,
  KEY_kana_HU                       = 0x04CC,
  KEY_kana_HE                       = 0x04CD,
  KEY_kana_HO                       = 0x04CE,
  KEY_kana_MA                       = 0x04CF,
  KEY_kana_MI                       = 0x04D0,
  KEY_kana_MU                       = 0x04D1,
  KEY_kana_ME                       = 0x04D2,
  KEY_kana_MO                       = 0x04D3,
  KEY_kana_YA                       = 0x04D4,
  KEY_kana_YU                       = 0x04D5,
  KEY_kana_YO                       = 0x04D6,
  KEY_kana_RA                       = 0x04D7,
  KEY_kana_RI                       = 0x04D8,
  KEY_kana_RU                       = 0x04D9,
  KEY_kana_RE                       = 0x04DA,
  KEY_kana_RO                       = 0x04DB,
  KEY_kana_WA                       = 0x04DC,
  KEY_kana_N                        = 0x04DD,
  KEY_voicedsound                   = 0x04DE,
  KEY_semivoicedsound               = 0x04DF,
  KEY_kana_switch                   = 0x0FF7,

  // Arabic
  KEY_Arabic_comma                  = 0x05AC,
  KEY_Arabic_semicolon              = 0x05BB,
  KEY_Arabic_question_mark          = 0x05BF,
  KEY_Arabic_hamza                  = 0x05C1,
  KEY_Arabic_maddaonalef            = 0x05C2,
  KEY_Arabic_hamzaonalef            = 0x05C3,
  KEY_Arabic_hamzaonwaw             = 0x05C4,
  KEY_Arabic_hamzaunderalef         = 0x05C5,
  KEY_Arabic_hamzaonyeh             = 0x05C6,
  KEY_Arabic_alef                   = 0x05C7,
  KEY_Arabic_beh                    = 0x05C8,
  KEY_Arabic_tehmarbuta             = 0x05C9,
  KEY_Arabic_teh                    = 0x05CA,
  KEY_Arabic_theh                   = 0x05CB,
  KEY_Arabic_jeem                   = 0x05CC,
  KEY_Arabic_hah                    = 0x05CD,
  KEY_Arabic_khah                   = 0x05CE,
  KEY_Arabic_dal                    = 0x05CF,
  KEY_Arabic_thal                   = 0x05D0,
  KEY_Arabic_ra                     = 0x05D1,
  KEY_Arabic_zain                   = 0x05D2,
  KEY_Arabic_seen                   = 0x05D3,
  KEY_Arabic_sheen                  = 0x05D4,
  KEY_Arabic_sad                    = 0x05D5,
  KEY_Arabic_dad                    = 0x05D6,
  KEY_Arabic_tah                    = 0x05D7,
  KEY_Arabic_zah                    = 0x05D8,
  KEY_Arabic_ain                    = 0x05D9,
  KEY_Arabic_ghain                  = 0x05DA,
  KEY_Arabic_tatweel                = 0x05E0,
  KEY_Arabic_feh                    = 0x05E1,
  KEY_Arabic_qaf                    = 0x05E2,
  KEY_Arabic_kaf                    = 0x05E3,
  KEY_Arabic_lam                    = 0x05E4,
  KEY_Arabic_meem                   = 0x05E5,
  KEY_Arabic_noon                   = 0x05E6,
  KEY_Arabic_ha                     = 0x05E7,
  KEY_Arabic_heh                    = 0x05E7,
  KEY_Arabic_waw                    = 0x05E8,
  KEY_Arabic_alefmaksura            = 0x05E9,
  KEY_Arabic_yeh                    = 0x05EA,
  KEY_Arabic_fathatan               = 0x05EB,
  KEY_Arabic_dammatan               = 0x05EC,
  KEY_Arabic_kasratan               = 0x05ED,
  KEY_Arabic_fatha                  = 0x05EE,
  KEY_Arabic_damma                  = 0x05EF,
  KEY_Arabic_kasra                  = 0x05F0,
  KEY_Arabic_shadda                 = 0x05F1,
  KEY_Arabic_sukun                  = 0x05F2,
  KEY_Arabic_switch                 = 0xFF7E,

  // Cyrillic
  KEY_Serbian_dje                   = 0x06A1,
  KEY_Macedonia_gje                 = 0x06A2,
  KEY_Cyrillic_io                   = 0x06A3,
  KEY_Ukrainian_ie                  = 0x06A4,
  KEY_Ukranian_je                   = 0x06A4,
  KEY_Macedonia_dse                 = 0x06A5,
  KEY_Ukrainian_i                   = 0x06A6,
  KEY_Ukranian_i                    = 0x06A6,
  KEY_Ukrainian_yi                  = 0x06A7,
  KEY_Ukranian_yi                   = 0x06A7,
  KEY_Cyrillic_je                   = 0x06A8,
  KEY_Serbian_je                    = 0x06A8,
  KEY_Cyrillic_lje                  = 0x06A9,
  KEY_Serbian_lje                   = 0x06A9,
  KEY_Cyrillic_nje                  = 0x06AA,
  KEY_Serbian_nje                   = 0x06AA,
  KEY_Serbian_tshe                  = 0x06AB,
  KEY_Macedonia_kje                 = 0x06AC,
  KEY_Byelorussian_shortu           = 0x06AE,
  KEY_Cyrillic_dzhe                 = 0x06AF,
  KEY_Serbian_dze                   = 0x06AF,
  KEY_numerosign                    = 0x06B0,
  KEY_Serbian_DJE                   = 0x06B1,
  KEY_Macedonia_GJE                 = 0x06B2,
  KEY_Cyrillic_IO                   = 0x06B3,
  KEY_Ukrainian_IE                  = 0x06B4,
  KEY_Ukranian_JE                   = 0x06B4,
  KEY_Macedonia_DSE                 = 0x06B5,
  KEY_Ukrainian_I                   = 0x06B6,
  KEY_Ukranian_I                    = 0x06B6,
  KEY_Ukrainian_YI                  = 0x06B7,
  KEY_Ukranian_YI                   = 0x06B7,
  KEY_Cyrillic_JE                   = 0x06B8,
  KEY_Serbian_JE                    = 0x06B8,
  KEY_Cyrillic_LJE                  = 0x06B9,
  KEY_Serbian_LJE                   = 0x06B9,
  KEY_Cyrillic_NJE                  = 0x06BA,
  KEY_Serbian_NJE                   = 0x06BA,
  KEY_Serbian_TSHE                  = 0x06BB,
  KEY_Macedonia_KJE                 = 0x06BC,
  KEY_Byelorussian_SHORTU           = 0x06BE,
  KEY_Cyrillic_DZHE                 = 0x06BF,
  KEY_Serbian_DZE                   = 0x06BF,
  KEY_Cyrillic_yu                   = 0x06C0,
  KEY_Cyrillic_a                    = 0x06C1,
  KEY_Cyrillic_be                   = 0x06C2,
  KEY_Cyrillic_tse                  = 0x06C3,
  KEY_Cyrillic_de                   = 0x06C4,
  KEY_Cyrillic_ie                   = 0x06C5,
  KEY_Cyrillic_ef                   = 0x06C6,
  KEY_Cyrillic_ghe                  = 0x06C7,
  KEY_Cyrillic_ha                   = 0x06C8,
  KEY_Cyrillic_i                    = 0x06C9,
  KEY_Cyrillic_shorti               = 0x06CA,
  KEY_Cyrillic_ka                   = 0x06CB,
  KEY_Cyrillic_el                   = 0x06CC,
  KEY_Cyrillic_em                   = 0x06CD,
  KEY_Cyrillic_en                   = 0x06CE,
  KEY_Cyrillic_o                    = 0x06CF,
  KEY_Cyrillic_pe                   = 0x06D0,
  KEY_Cyrillic_ya                   = 0x06D1,
  KEY_Cyrillic_er                   = 0x06D2,
  KEY_Cyrillic_es                   = 0x06D3,
  KEY_Cyrillic_te                   = 0x06D4,
  KEY_Cyrillic_u                    = 0x06D5,
  KEY_Cyrillic_zhe                  = 0x06D6,
  KEY_Cyrillic_ve                   = 0x06D7,
  KEY_Cyrillic_softsign             = 0x06D8,
  KEY_Cyrillic_yeru                 = 0x06D9,
  KEY_Cyrillic_ze                   = 0x06DA,
  KEY_Cyrillic_sha                  = 0x06DB,
  KEY_Cyrillic_e                    = 0x06DC,
  KEY_Cyrillic_shcha                = 0x06DD,
  KEY_Cyrillic_che                  = 0x06DE,
  KEY_Cyrillic_hardsign             = 0x06DF,
  KEY_Cyrillic_YU                   = 0x06E0,
  KEY_Cyrillic_A                    = 0x06E1,
  KEY_Cyrillic_BE                   = 0x06E2,
  KEY_Cyrillic_TSE                  = 0x06E3,
  KEY_Cyrillic_DE                   = 0x06E4,
  KEY_Cyrillic_IE                   = 0x06E5,
  KEY_Cyrillic_EF                   = 0x06E6,
  KEY_Cyrillic_GHE                  = 0x06E7,
  KEY_Cyrillic_HA                   = 0x06E8,
  KEY_Cyrillic_I                    = 0x06E9,
  KEY_Cyrillic_SHORTI               = 0x06EA,
  KEY_Cyrillic_KA                   = 0x06EB,
  KEY_Cyrillic_EL                   = 0x06EC,
  KEY_Cyrillic_EM                   = 0x06ED,
  KEY_Cyrillic_EN                   = 0x06EE,
  KEY_Cyrillic_O                    = 0x06EF,
  KEY_Cyrillic_PE                   = 0x06F0,
  KEY_Cyrillic_YA                   = 0x06F1,
  KEY_Cyrillic_ER                   = 0x06F2,
  KEY_Cyrillic_ES                   = 0x06F3,
  KEY_Cyrillic_TE                   = 0x06F4,
  KEY_Cyrillic_U                    = 0x06F5,
  KEY_Cyrillic_ZHE                  = 0x06F6,
  KEY_Cyrillic_VE                   = 0x06F7,
  KEY_Cyrillic_SOFTSIGN             = 0x06F8,
  KEY_Cyrillic_YERU                 = 0x06F9,
  KEY_Cyrillic_ZE                   = 0x06FA,
  KEY_Cyrillic_SHA                  = 0x06FB,
  KEY_Cyrillic_E                    = 0x06FC,
  KEY_Cyrillic_SHCHA                = 0x06FD,
  KEY_Cyrillic_CHE                  = 0x06FE,
  KEY_Cyrillic_HARDSIGN             = 0x06FF,

  // Greek
  KEY_Greek_ALPHAaccent             = 0x07A1,
  KEY_Greek_EPSILONaccent           = 0x07A2,
  KEY_Greek_ETAaccent               = 0x07A3,
  KEY_Greek_IOTAaccent              = 0x07A4,
  KEY_Greek_IOTAdiaeresis           = 0x07A5,
  KEY_Greek_OMICRONaccent           = 0x07A7,
  KEY_Greek_UPSILONaccent           = 0x07A8,
  KEY_Greek_UPSILONdieresis         = 0x07A9,
  KEY_Greek_OMEGAaccent             = 0x07AB,
  KEY_Greek_accentdieresis          = 0x07AE,
  KEY_Greek_horizbar                = 0x07AF,
  KEY_Greek_alphaaccent             = 0x07B1,
  KEY_Greek_epsilonaccent           = 0x07B2,
  KEY_Greek_etaaccent               = 0x07B3,
  KEY_Greek_iotaaccent              = 0x07B4,
  KEY_Greek_iotadieresis            = 0x07B5,
  KEY_Greek_iotaaccentdieresis      = 0x07B6,
  KEY_Greek_omicronaccent           = 0x07B7,
  KEY_Greek_upsilonaccent           = 0x07B8,
  KEY_Greek_upsilondieresis         = 0x07B9,
  KEY_Greek_upsilonaccentdieresis   = 0x07BA,
  KEY_Greek_omegaaccent             = 0x07BB,
  KEY_Greek_ALPHA                   = 0x07C1,
  KEY_Greek_BETA                    = 0x07C2,
  KEY_Greek_GAMMA                   = 0x07C3,
  KEY_Greek_DELTA                   = 0x07C4,
  KEY_Greek_EPSILON                 = 0x07C5,
  KEY_Greek_ZETA                    = 0x07C6,
  KEY_Greek_ETA                     = 0x07C7,
  KEY_Greek_THETA                   = 0x07C8,
  KEY_Greek_IOTA                    = 0x07C9,
  KEY_Greek_KAPPA                   = 0x07CA,
  KEY_Greek_LAMDA                   = 0x07CB,
  KEY_Greek_LAMBDA                  = 0x07CB,
  KEY_Greek_MU                      = 0x07CC,
  KEY_Greek_NU                      = 0x07CD,
  KEY_Greek_XI                      = 0x07CE,
  KEY_Greek_OMICRON                 = 0x07CF,
  KEY_Greek_PI                      = 0x07D0,
  KEY_Greek_RHO                     = 0x07D1,
  KEY_Greek_SIGMA                   = 0x07D2,
  KEY_Greek_TAU                     = 0x07D4,
  KEY_Greek_UPSILON                 = 0x07D5,
  KEY_Greek_PHI                     = 0x07D6,
  KEY_Greek_CHI                     = 0x07D7,
  KEY_Greek_PSI                     = 0x07D8,
  KEY_Greek_OMEGA                   = 0x07D9,
  KEY_Greek_alpha                   = 0x07E1,
  KEY_Greek_beta                    = 0x07E2,
  KEY_Greek_gamma                   = 0x07E3,
  KEY_Greek_delta                   = 0x07E4,
  KEY_Greek_epsilon                 = 0x07E5,
  KEY_Greek_zeta                    = 0x07E6,
  KEY_Greek_eta                     = 0x07E7,
  KEY_Greek_theta                   = 0x07E8,
  KEY_Greek_iota                    = 0x07E9,
  KEY_Greek_kappa                   = 0x07EA,
  KEY_Greek_lamda                   = 0x07EB,
  KEY_Greek_lambda                  = 0x07EB,
  KEY_Greek_mu                      = 0x07EC,
  KEY_Greek_nu                      = 0x07ED,
  KEY_Greek_xi                      = 0x07EE,
  KEY_Greek_omicron                 = 0x07EF,
  KEY_Greek_pi                      = 0x07F0,
  KEY_Greek_rho                     = 0x07F1,
  KEY_Greek_sigma                   = 0x07F2,
  KEY_Greek_finalsmallsigma         = 0x07F3,
  KEY_Greek_tau                     = 0x07F4,
  KEY_Greek_upsilon                 = 0x07F5,
  KEY_Greek_phi                     = 0x07F6,
  KEY_Greek_chi                     = 0x07F7,
  KEY_Greek_psi                     = 0x07F8,
  KEY_Greek_omega                   = 0x07F9,
  KEY_Greek_switch                  = 0xFF7E,

  // Technical
  KEY_leftradical                   = 0x08A1,
  KEY_topleftradical                = 0x08A2,
  KEY_horizconnector                = 0x08A3,
  KEY_topintegral                   = 0x08A4,
  KEY_botintegral                   = 0x08A5,
  KEY_vertconnector                 = 0x08A6,
  KEY_topleftsqbracket              = 0x08A7,
  KEY_botleftsqbracket              = 0x08A8,
  KEY_toprightsqbracket             = 0x08A9,
  KEY_botrightsqbracket             = 0x08AA,
  KEY_topleftparens                 = 0x08AB,
  KEY_botleftparens                 = 0x08AC,
  KEY_toprightparens                = 0x08AD,
  KEY_botrightparens                = 0x08AE,
  KEY_leftmiddlecurlybrace          = 0x08AF,
  KEY_rightmiddlecurlybrace         = 0x08B0,
  KEY_topleftsummation              = 0x08B1,
  KEY_botleftsummation              = 0x08B2,
  KEY_topvertsummationconnector     = 0x08B3,
  KEY_botvertsummationconnector     = 0x08B4,
  KEY_toprightsummation             = 0x08B5,
  KEY_botrightsummation             = 0x08B6,
  KEY_rightmiddlesummation          = 0x08B7,
  KEY_lessthanequal                 = 0x08BC,
  KEY_notequal                      = 0x08BD,
  KEY_greaterthanequal              = 0x08BE,
  KEY_integral                      = 0x08BF,
  KEY_therefore                     = 0x08C0,
  KEY_variation                     = 0x08C1,
  KEY_infinity                      = 0x08C2,
  KEY_nabla                         = 0x08C5,
  KEY_approximate                   = 0x08C8,
  KEY_similarequal                  = 0x08C9,
  KEY_ifonlyif                      = 0x08CD,
  KEY_implies                       = 0x08CE,
  KEY_identical                     = 0x08CF,
  KEY_radical                       = 0x08D6,
  KEY_includedin                    = 0x08DA,
  KEY_includes                      = 0x08DB,
  KEY_intersection                  = 0x08DC,
  KEY_union                         = 0x08DD,
  KEY_logicaland                    = 0x08DE,
  KEY_logicalor                     = 0x08DF,
  KEY_partialderivative             = 0x08EF,
  KEY_function                      = 0x08F6,
  KEY_leftarrow                     = 0x08FB,
  KEY_uparrow                       = 0x08FC,
  KEY_rightarrow                    = 0x08FD,
  KEY_downarrow                     = 0x08FE,

  // Special
  KEY_blank                         = 0x09DF,
  KEY_soliddiamond                  = 0x09E0,
  KEY_checkerboard                  = 0x09E1,
  KEY_ht                            = 0x09E2,
  KEY_ff                            = 0x09E3,
  KEY_cr                            = 0x09E4,
  KEY_lf                            = 0x09E5,
  KEY_nl                            = 0x09E8,
  KEY_vt                            = 0x09E9,
  KEY_lowrightcorner                = 0x09EA,
  KEY_uprightcorner                 = 0x09EB,
  KEY_upleftcorner                  = 0x09EC,
  KEY_lowleftcorner                 = 0x09ED,
  KEY_crossinglines                 = 0x09EE,
  KEY_horizlinescan1                = 0x09EF,
  KEY_horizlinescan3                = 0x09F0,
  KEY_horizlinescan5                = 0x09F1,
  KEY_horizlinescan7                = 0x09F2,
  KEY_horizlinescan9                = 0x09F3,
  KEY_leftt                         = 0x09F4,
  KEY_rightt                        = 0x09F5,
  KEY_bott                          = 0x09F6,
  KEY_topt                          = 0x09F7,
  KEY_vertbar                       = 0x09F8,

  // Publishing
  KEY_emspace                       = 0x0AA1,
  KEY_enspace                       = 0x0AA2,
  KEY_em3space                      = 0x0AA3,
  KEY_em4space                      = 0x0AA4,
  KEY_digitspace                    = 0x0AA5,
  KEY_punctspace                    = 0x0AA6,
  KEY_thinspace                     = 0x0AA7,
  KEY_hairspace                     = 0x0AA8,
  KEY_emdash                        = 0x0AA9,
  KEY_endash                        = 0x0AAA,
  KEY_signifblank                   = 0x0AAC,
  KEY_ellipsis                      = 0x0AAE,
  KEY_doubbaselinedot               = 0x0AAF,
  KEY_onethird                      = 0x0AB0,
  KEY_twothirds                     = 0x0AB1,
  KEY_onefifth                      = 0x0AB2,
  KEY_twofifths                     = 0x0AB3,
  KEY_threefifths                   = 0x0AB4,
  KEY_fourfifths                    = 0x0AB5,
  KEY_onesixth                      = 0x0AB6,
  KEY_fivesixths                    = 0x0AB7,
  KEY_careof                        = 0x0AB8,
  KEY_figdash                       = 0x0ABB,
  KEY_leftanglebracket              = 0x0ABC,
  KEY_decimalpoint                  = 0x0ABD,
  KEY_rightanglebracket             = 0x0ABE,
  KEY_marker                        = 0x0ABF,
  KEY_oneeighth                     = 0x0AC3,
  KEY_threeeighths                  = 0x0AC4,
  KEY_fiveeighths                   = 0x0AC5,
  KEY_seveneighths                  = 0x0AC6,
  KEY_trademark                     = 0x0AC9,
  KEY_signaturemark                 = 0x0ACA,
  KEY_trademarkincircle             = 0x0ACB,
  KEY_leftopentriangle              = 0x0ACC,
  KEY_rightopentriangle             = 0x0ACD,
  KEY_emopencircle                  = 0x0ACE,
  KEY_emopenrectangle               = 0x0ACF,
  KEY_leftsinglequotemark           = 0x0AD0,
  KEY_rightsinglequotemark          = 0x0AD1,
  KEY_leftdoublequotemark           = 0x0AD2,
  KEY_rightdoublequotemark          = 0x0AD3,
  KEY_prescription                  = 0x0AD4,
  KEY_minutes                       = 0x0AD6,
  KEY_seconds                       = 0x0AD7,
  KEY_latincross                    = 0x0AD9,
  KEY_hexagram                      = 0x0ADA,
  KEY_filledrectbullet              = 0x0ADB,
  KEY_filledlefttribullet           = 0x0ADC,
  KEY_filledrighttribullet          = 0x0ADD,
  KEY_emfilledcircle                = 0x0ADE,
  KEY_emfilledrect                  = 0x0ADF,
  KEY_enopencircbullet              = 0x0AE0,
  KEY_enopensquarebullet            = 0x0AE1,
  KEY_openrectbullet                = 0x0AE2,
  KEY_opentribulletup               = 0x0AE3,
  KEY_opentribulletdown             = 0x0AE4,
  KEY_openstar                      = 0x0AE5,
  KEY_enfilledcircbullet            = 0x0AE6,
  KEY_enfilledsqbullet              = 0x0AE7,
  KEY_filledtribulletup             = 0x0AE8,
  KEY_filledtribulletdown           = 0x0AE9,
  KEY_leftpointer                   = 0x0AEA,
  KEY_rightpointer                  = 0x0AEB,
  KEY_club                          = 0x0AEC,
  KEY_diamond                       = 0x0AED,
  KEY_heart                         = 0x0AEE,
  KEY_maltesecross                  = 0x0AF0,
  KEY_dagger                        = 0x0AF1,
  KEY_doubledagger                  = 0x0AF2,
  KEY_checkmark                     = 0x0AF3,
  KEY_ballotcross                   = 0x0AF4,
  KEY_musicalsharp                  = 0x0AF5,
  KEY_musicalflat                   = 0x0AF6,
  KEY_malesymbol                    = 0x0AF7,
  KEY_femalesymbol                  = 0x0AF8,
  KEY_telephone                     = 0x0AF9,
  KEY_telephonerecorder             = 0x0AFA,
  KEY_phonographcopyright           = 0x0AFB,
  KEY_caret                         = 0x0AFC,
  KEY_singlelowquotemark            = 0x0AFD,
  KEY_doublelowquotemark            = 0x0AFE,
  KEY_cursor                        = 0x0AFF,

  // APL
  KEY_leftcaret                     = 0x0BA3,
  KEY_rightcaret                    = 0x0BA6,
  KEY_downcaret                     = 0x0BA8,
  KEY_upcaret                       = 0x0BA9,
  KEY_overbar                       = 0x0BC0,
  KEY_downtack                      = 0x0BC2,
  KEY_upshoe                        = 0x0BC3,
  KEY_downstile                     = 0x0BC4,
  KEY_underbar                      = 0x0BC6,
  KEY_jot                           = 0x0BCA,
  KEY_quad                          = 0x0BCC,
  KEY_uptack                        = 0x0BCE,
  KEY_circle                        = 0x0BCF,
  KEY_upstile                       = 0x0BD3,
  KEY_downshoe                      = 0x0BD6,
  KEY_rightshoe                     = 0x0BD8,
  KEY_leftshoe                      = 0x0BDA,
  KEY_lefttack                      = 0x0BDC,
  KEY_righttack                     = 0x0BFC,

  // Hebrew
  KEY_hebrew_doublelowline          = 0x0CDF,
  KEY_hebrew_aleph                  = 0x0CE0,
  KEY_hebrew_bet                    = 0x0CE1,
  KEY_hebrew_beth                   = 0x0CE1,
  KEY_hebrew_gimel                  = 0x0CE2,
  KEY_hebrew_gimmel                 = 0x0CE2,
  KEY_hebrew_dalet                  = 0x0CE3,
  KEY_hebrew_daleth                 = 0x0CE3,
  KEY_hebrew_he                     = 0x0CE4,
  KEY_hebrew_waw                    = 0x0CE5,
  KEY_hebrew_zain                   = 0x0CE6,
  KEY_hebrew_zayin                  = 0x0CE6,
  KEY_hebrew_chet                   = 0x0CE7,
  KEY_hebrew_het                    = 0x0CE7,
  KEY_hebrew_tet                    = 0x0CE8,
  KEY_hebrew_teth                   = 0x0CE8,
  KEY_hebrew_yod                    = 0x0CE9,
  KEY_hebrew_finalkaph              = 0x0CEA,
  KEY_hebrew_kaph                   = 0x0CEB,
  KEY_hebrew_lamed                  = 0x0CEC,
  KEY_hebrew_finalmem               = 0x0CED,
  KEY_hebrew_mem                    = 0x0CEE,
  KEY_hebrew_finalnun               = 0x0CEF,
  KEY_hebrew_nun                    = 0x0CF0,
  KEY_hebrew_samech                 = 0x0CF1,
  KEY_hebrew_samekh                 = 0x0CF1,
  KEY_hebrew_ayin                   = 0x0CF2,
  KEY_hebrew_finalpe                = 0x0CF3,
  KEY_hebrew_pe                     = 0x0CF4,
  KEY_hebrew_finalzade              = 0x0CF5,
  KEY_hebrew_finalzadi              = 0x0CF5,
  KEY_hebrew_zade                   = 0x0CF6,
  KEY_hebrew_zadi                   = 0x0CF6,
  KEY_hebrew_qoph                   = 0x0CF7,
  KEY_hebrew_kuf                    = 0x0CF7,
  KEY_hebrew_resh                   = 0x0CF8,
  KEY_hebrew_shin                   = 0x0CF9,
  KEY_hebrew_taw                    = 0x0CFA,
  KEY_hebrew_taf                    = 0x0CFA,
  KEY_Hebrew_switch                 = 0xFF7E,

  // Thai
  KEY_Thai_kokai                    = 0x0DA1,
  KEY_Thai_khokhai                  = 0x0DA2,
  KEY_Thai_khokhuat                 = 0x0DA3,
  KEY_Thai_khokhwai                 = 0x0DA4,
  KEY_Thai_khokhon                  = 0x0DA5,
  KEY_Thai_khorakhang               = 0x0DA6,
  KEY_Thai_ngongu                   = 0x0DA7,
  KEY_Thai_chochan                  = 0x0DA8,
  KEY_Thai_choching                 = 0x0DA9,
  KEY_Thai_chochang                 = 0x0DAA,
  KEY_Thai_soso                     = 0x0DAB,
  KEY_Thai_chochoe                  = 0x0DAC,
  KEY_Thai_yoying                   = 0x0DAD,
  KEY_Thai_dochada                  = 0x0DAE,
  KEY_Thai_topatak                  = 0x0DAF,
  KEY_Thai_thothan                  = 0x0DB0,
  KEY_Thai_thonangmontho            = 0x0DB1,
  KEY_Thai_thophuthao               = 0x0DB2,
  KEY_Thai_nonen                    = 0x0DB3,
  KEY_Thai_dodek                    = 0x0DB4,
  KEY_Thai_totao                    = 0x0DB5,
  KEY_Thai_thothung                 = 0x0DB6,
  KEY_Thai_thothahan                = 0x0DB7,
  KEY_Thai_thothong                 = 0x0DB8,
  KEY_Thai_nonu                     = 0x0DB9,
  KEY_Thai_bobaimai                 = 0x0DBA,
  KEY_Thai_popla                    = 0x0DBB,
  KEY_Thai_phophung                 = 0x0DBC,
  KEY_Thai_fofa                     = 0x0DBD,
  KEY_Thai_phophan                  = 0x0DBE,
  KEY_Thai_fofan                    = 0x0DBF,
  KEY_Thai_phosamphao               = 0x0DC0,
  KEY_Thai_moma                     = 0x0DC1,
  KEY_Thai_yoyak                    = 0x0DC2,
  KEY_Thai_rorua                    = 0x0DC3,
  KEY_Thai_ru                       = 0x0DC4,
  KEY_Thai_loling                   = 0x0DC5,
  KEY_Thai_lu                       = 0x0DC6,
  KEY_Thai_wowaen                   = 0x0DC7,
  KEY_Thai_sosala                   = 0x0DC8,
  KEY_Thai_sorusi                   = 0x0DC9,
  KEY_Thai_sosua                    = 0x0DCA,
  KEY_Thai_hohip                    = 0x0DCB,
  KEY_Thai_lochula                  = 0x0DCC,
  KEY_Thai_oang                     = 0x0DCD,
  KEY_Thai_honokhuk                 = 0x0DCE,
  KEY_Thai_paiyannoi                = 0x0DCF,
  KEY_Thai_saraa                    = 0x0DD0,
  KEY_Thai_maihanakat               = 0x0DD1,
  KEY_Thai_saraaa                   = 0x0DD2,
  KEY_Thai_saraam                   = 0x0DD3,
  KEY_Thai_sarai                    = 0x0DD4,
  KEY_Thai_saraii                   = 0x0DD5,
  KEY_Thai_saraue                   = 0x0DD6,
  KEY_Thai_sarauee                  = 0x0DD7,
  KEY_Thai_sarau                    = 0x0DD8,
  KEY_Thai_sarauu                   = 0x0DD9,
  KEY_Thai_phinthu                  = 0x0DDA,
  KEY_Thai_maihanakat_maitho        = 0x0DDE,
  KEY_Thai_baht                     = 0x0DDF,
  KEY_Thai_sarae                    = 0x0DE0,
  KEY_Thai_saraae                   = 0x0DE1,
  KEY_Thai_sarao                    = 0x0DE2,
  KEY_Thai_saraaimaimuan            = 0x0DE3,
  KEY_Thai_saraaimaimalai           = 0x0DE4,
  KEY_Thai_lakkhangyao              = 0x0DE5,
  KEY_Thai_maiyamok                 = 0x0DE6,
  KEY_Thai_maitaikhu                = 0x0DE7,
  KEY_Thai_maiek                    = 0x0DE8,
  KEY_Thai_maitho                   = 0x0DE9,
  KEY_Thai_maitri                   = 0x0DEA,
  KEY_Thai_maichattawa              = 0x0DEB,
  KEY_Thai_thanthakhat              = 0x0DEC,
  KEY_Thai_nikhahit                 = 0x0DED,
  KEY_Thai_leksun                   = 0x0DF0,
  KEY_Thai_leknung                  = 0x0DF1,
  KEY_Thai_leksong                  = 0x0DF2,
  KEY_Thai_leksam                   = 0x0DF3,
  KEY_Thai_leksi                    = 0x0DF4,
  KEY_Thai_lekha                    = 0x0DF5,
  KEY_Thai_lekhok                   = 0x0DF6,
  KEY_Thai_lekchet                  = 0x0DF7,
  KEY_Thai_lekpaet                  = 0x0DF8,
  KEY_Thai_lekkao                   = 0x0DF9,

  // Korean
  KEY_Hangul                        = 0xFF31,
  KEY_Hangul_Start                  = 0xFF32,
  KEY_Hangul_End                    = 0xFF33,
  KEY_Hangul_Hanja                  = 0xFF34,
  KEY_Hangul_Jamo                   = 0xFF35,
  KEY_Hangul_Romaja                 = 0xFF36,
  KEY_Hangul_Codeinput              = 0xFF37,
  KEY_Hangul_Jeonja                 = 0xFF38,
  KEY_Hangul_Banja                  = 0xFF39,
  KEY_Hangul_PreHanja               = 0xFF3A,
  KEY_Hangul_PostHanja              = 0xFF3B,
  KEY_Hangul_SingleCandidate        = 0xFF3C,
  KEY_Hangul_MultipleCandidate      = 0xFF3D,
  KEY_Hangul_PreviousCandidate      = 0xFF3E,
  KEY_Hangul_Special                = 0xFF3F,
  KEY_Hangul_switch                 = 0xFF7E,
  KEY_Hangul_Kiyeog                 = 0x0EA1,
  KEY_Hangul_SsangKiyeog            = 0x0EA2,
  KEY_Hangul_KiyeogSios             = 0x0EA3,
  KEY_Hangul_Nieun                  = 0x0EA4,
  KEY_Hangul_NieunJieuj             = 0x0EA5,
  KEY_Hangul_NieunHieuh             = 0x0EA6,
  KEY_Hangul_Dikeud                 = 0x0EA7,
  KEY_Hangul_SsangDikeud            = 0x0EA8,
  KEY_Hangul_Rieul                  = 0x0EA9,
  KEY_Hangul_RieulKiyeog            = 0x0EAA,
  KEY_Hangul_RieulMieum             = 0x0EAB,
  KEY_Hangul_RieulPieub             = 0x0EAC,
  KEY_Hangul_RieulSios              = 0x0EAD,
  KEY_Hangul_RieulTieut             = 0x0EAE,
  KEY_Hangul_RieulPhieuf            = 0x0EAF,
  KEY_Hangul_RieulHieuh             = 0x0EB0,
  KEY_Hangul_Mieum                  = 0x0EB1,
  KEY_Hangul_Pieub                  = 0x0EB2,
  KEY_Hangul_SsangPieub             = 0x0EB3,
  KEY_Hangul_PieubSios              = 0x0EB4,
  KEY_Hangul_Sios                   = 0x0EB5,
  KEY_Hangul_SsangSios              = 0x0EB6,
  KEY_Hangul_Ieung                  = 0x0EB7,
  KEY_Hangul_Jieuj                  = 0x0EB8,
  KEY_Hangul_SsangJieuj             = 0x0EB9,
  KEY_Hangul_Cieuc                  = 0x0EBA,
  KEY_Hangul_Khieuq                 = 0x0EBB,
  KEY_Hangul_Tieut                  = 0x0EBC,
  KEY_Hangul_Phieuf                 = 0x0EBD,
  KEY_Hangul_Hieuh                  = 0x0EBE,
  KEY_Hangul_A                      = 0x0EBF,
  KEY_Hangul_AE                     = 0x0EC0,
  KEY_Hangul_YA                     = 0x0EC1,
  KEY_Hangul_YAE                    = 0x0EC2,
  KEY_Hangul_EO                     = 0x0EC3,
  KEY_Hangul_E                      = 0x0EC4,
  KEY_Hangul_YEO                    = 0x0EC5,
  KEY_Hangul_YE                     = 0x0EC6,
  KEY_Hangul_O                      = 0x0EC7,
  KEY_Hangul_WA                     = 0x0EC8,
  KEY_Hangul_WAE                    = 0x0EC9,
  KEY_Hangul_OE                     = 0x0ECA,
  KEY_Hangul_YO                     = 0x0ECB,
  KEY_Hangul_U                      = 0x0ECC,
  KEY_Hangul_WEO                    = 0x0ECD,
  KEY_Hangul_WE                     = 0x0ECE,
  KEY_Hangul_WI                     = 0x0ECF,
  KEY_Hangul_YU                     = 0x0ED0,
  KEY_Hangul_EU                     = 0x0ED1,
  KEY_Hangul_YI                     = 0x0ED2,
  KEY_Hangul_I                      = 0x0ED3,
  KEY_Hangul_J_Kiyeog               = 0x0ED4,
  KEY_Hangul_J_SsangKiyeog          = 0x0ED5,
  KEY_Hangul_J_KiyeogSios           = 0x0ED6,
  KEY_Hangul_J_Nieun                = 0x0ED7,
  KEY_Hangul_J_NieunJieuj           = 0x0ED8,
  KEY_Hangul_J_NieunHieuh           = 0x0ED9,
  KEY_Hangul_J_Dikeud               = 0x0EDA,
  KEY_Hangul_J_Rieul                = 0x0EDB,
  KEY_Hangul_J_RieulKiyeog          = 0x0EDC,
  KEY_Hangul_J_RieulMieum           = 0x0EDD,
  KEY_Hangul_J_RieulPieub           = 0x0EDE,
  KEY_Hangul_J_RieulSios            = 0x0EDF,
  KEY_Hangul_J_RieulTieut           = 0x0EE0,
  KEY_Hangul_J_RieulPhieuf          = 0x0EE1,
  KEY_Hangul_J_RieulHieuh           = 0x0EE2,
  KEY_Hangul_J_Mieum                = 0x0EE3,
  KEY_Hangul_J_Pieub                = 0x0EE4,
  KEY_Hangul_J_PieubSios            = 0x0EE5,
  KEY_Hangul_J_Sios                 = 0x0EE6,
  KEY_Hangul_J_SsangSios            = 0x0EE7,
  KEY_Hangul_J_Ieung                = 0x0EE8,
  KEY_Hangul_J_Jieuj                = 0x0EE9,
  KEY_Hangul_J_Cieuc                = 0x0EEA,
  KEY_Hangul_J_Khieuq               = 0x0EEB,
  KEY_Hangul_J_Tieut                = 0x0EEC,
  KEY_Hangul_J_Phieuf               = 0x0EED,
  KEY_Hangul_J_Hieuh                = 0x0EEE,
  KEY_Hangul_RieulYeorinHieuh       = 0x0EEF,
  KEY_Hangul_SunkyeongeumMieum      = 0x0EF0,
  KEY_Hangul_SunkyeongeumPieub      = 0x0EF1,
  KEY_Hangul_PanSios                = 0x0EF2,
  KEY_Hangul_KkogjiDalrinIeung      = 0x0EF3,
  KEY_Hangul_SunkyeongeumPhieuf     = 0x0EF4,
  KEY_Hangul_YeorinHieuh            = 0x0EF5,
  KEY_Hangul_AraeA                  = 0x0EF6,
  KEY_Hangul_AraeAE                 = 0x0EF7,
  KEY_Hangul_J_PanSios              = 0x0EF8,
  KEY_Hangul_J_KkogjiDalrinIeung    = 0x0EF9,
  KEY_Hangul_J_YeorinHieuh          = 0x0EFA,
  KEY_Korean_Won                    = 0x0EFF
  };


/*********************************  Typedefs  **********************************/


// Forward declarations
class FXObject;
class FXStream;

// Streamable types; these are fixed size!
typedef char                   FXchar;
typedef unsigned char          FXuchar;
typedef FXuchar                FXbool;
typedef unsigned short         FXushort;
typedef short                  FXshort;
typedef unsigned int           FXuint;
typedef int                    FXint;
typedef float                  FXfloat;
typedef double                 FXdouble;
typedef FXObject              *FXObjectPtr;
typedef unsigned long          FXuval;

// Time since January 1, 1970 (UTC)
typedef long                   FXTime;

// Pixel type (could be color index)
typedef unsigned long          FXPixel;

// RGBA pixel value
typedef FXuint                 FXColor;

// Hot key
typedef FXuint                 FXHotKey;

// Drag type
typedef unsigned int            FXDragType;

// Input source handle type (see ruby-typemaps.i)
typedef FXint                  FXInputHandle;


/**********************************  Macros  ***********************************/
/// Make int out of two shorts
%rename(MKUINT) _MKUINT;

/// Make selector from message type and message id
%rename(FXSEL) _FXSEL;

/// Get type from selector
%rename(FXSELTYPE) _FXSELTYPE;

/// Get ID from selector
%rename(FXSELID) _FXSELID;


%inline %{
static FXuint _MKUINT(FXushort l,FXushort h){
  return ((((FX::FXuint)(l))&0xffff) | (((FX::FXuint)(h))<<16));
  }

static FXuint _FXSEL(FXushort type,FXushort id){
  return ((((FX::FXuint)(id))&0xffff) | (((FX::FXuint)(type))<<16));
  }

static FXushort _FXSELTYPE(FXuint s){
  return ((FX::FXushort)(((s)>>16)&0xffff));
  }

static FXushort _FXSELID(FXuint s){
  return ((FX::FXushort)(s&0xffff));
  }
%}

/// Make RGB color
%rename(FXRGB) _FXRGB;

/// Make RGBA color
%rename(FXRGBA) _FXRGBA;

/// Get red value from RGBA color
%rename(FXREDVAL) _FXREDVAL;

/// Get green value from RGBA color
%rename(FXGREENVAL) _FXGREENVAL;

/// Get blue value from RGBA color
%rename(FXBLUEVAL) _FXBLUEVAL;

/// Get alpha value from RGBA color
%rename(FXALPHAVAL) _FXALPHAVAL;

/// Get component value of RGBA color
%rename(FXRGBACOMPVAL) _FXRGBACOMPVAL;

// The order in memory is [R G B A] matches that in FXColor
%inline %{
static FXuint _FXRGB(FXuchar r,FXuchar g,FXuchar b){
  return (FXRGBA(0xff,b,g,r));
  }

static FXuint _FXRGBA(FXuchar r,FXuchar g,FXuchar b,FXuchar a){
  return (FXRGBA(a,b,g,r));
  }

static FXuchar _FXREDVAL(FXuint rgba){
  return FXREDVAL(rgba);
  }

static FXuchar _FXGREENVAL(FXuint rgba){
  return FXGREENVAL(rgba);
  }

static FXuchar _FXBLUEVAL(FXuint rgba){
  return FXBLUEVAL(rgba);
  }

static FXuchar _FXALPHAVAL(FXuint rgba){
  return FXALPHAVAL(rgba);
  }

static FXuchar _FXRGBACOMPVAL(FXuint rgba,FXuchar comp){
  return FXRGBACOMPVAL(rgba,comp);
  }
%}

/**********************************  Globals  **********************************/

