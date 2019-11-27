/********************************************************************************
*                                                                               *
*                     A p p l i c a t i o n   O b j e c t                       *
*                                                                               *
*********************************************************************************
* Copyright (C) 1997,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
*********************************************************************************
* This library is free software; you can redistribute it and/or                 *
* modify it under the terms of the GNU Lesser General Public                    *
* License as published by the Free Software Foundation; either                  *
* version 2.1 of the License, or (at your option) any later version.            *
*                                                                               *
* This library is distributed in the hope that it will be useful,               *
* but WITHOUT ANY WARRANTY; without even the implied warranty of                *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU             *
* Lesser General Public License for more details.                               *
*                                                                               *
* You should have received a copy of the GNU Lesser General Public              *
* License along with this library; if not, write to the Free Software           *
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.    *
*********************************************************************************
* $Id: FXApp.h,v 1.230 2006/01/22 17:57:58 fox Exp $                            *
********************************************************************************/

%pythonappend FX::FXApp::FXApp %{
  self.thisown = False
%}


#ifndef FXOBJECT_H
#include "FXObject.h"
#endif

namespace FX {


// Forward declarations
class FXApp;
class FXWindow;
class FXIcon;
class FXBitmap;
class FXCursor;
class FXRootWindow;
class FXMainWindow;
class FXPopup;
class FXFont;
class FXDC;
class FXDCWindow;
class FXVisual;
class FXGLVisual;
class FXGLContext;
class FXTranslator;
class FXComposeContext;

// Opaque FOX objects
struct FXTimer;
struct FXChore;



/// File input modes for addInput
enum FXInputMode {
  INPUT_NONE   = 0,                 /// Inactive
  INPUT_READ   = 1,                 /// Read input fd
  INPUT_WRITE  = 2,                 /// Write input fd
  INPUT_EXCEPT = 4                  /// Except input fd
  };


/// All ways of being modal
enum FXModality {
  MODAL_FOR_NONE,                 /// Non modal event loop (dispatch normally)
  MODAL_FOR_WINDOW,               /// Modal dialog (beep if outside of modal dialog)
  MODAL_FOR_POPUP                 /// Modal for popup (always dispatch to popup)
  };


/// Default cursors provided by the application
enum FXDefaultCursor {
  DEF_ARROW_CURSOR,                     /// Arrow cursor
  DEF_RARROW_CURSOR,                    /// Reverse arrow cursor
  DEF_TEXT_CURSOR,                      /// Text cursor
  DEF_HSPLIT_CURSOR,                    /// Horizontal split cursor
  DEF_VSPLIT_CURSOR,                    /// Vertical split cursor
  DEF_XSPLIT_CURSOR,                    /// Cross split cursor
  DEF_SWATCH_CURSOR,                    /// Color swatch drag cursor
  DEF_MOVE_CURSOR,                      /// Move cursor
  DEF_DRAGH_CURSOR,                     /// Resize horizontal edge
  DEF_DRAGV_CURSOR,                     /// Resize vertical edge
  DEF_DRAGTL_CURSOR,                    /// Resize upper-leftcorner
  DEF_DRAGBR_CURSOR=DEF_DRAGTL_CURSOR,  /// Resize bottom-right corner
  DEF_DRAGTR_CURSOR,                    /// Resize upper-right corner
  DEF_DRAGBL_CURSOR=DEF_DRAGTR_CURSOR,  /// Resize bottom-left corner
  DEF_DNDSTOP_CURSOR,                   /// Drag and drop stop
  DEF_DNDCOPY_CURSOR,                   /// Drag and drop copy
  DEF_DNDMOVE_CURSOR,                   /// Drag and drop move
  DEF_DNDLINK_CURSOR,                   /// Drag and drop link
  DEF_CROSSHAIR_CURSOR,                 /// Cross hair cursor
  DEF_CORNERNE_CURSOR,                  /// North-east cursor
  DEF_CORNERNW_CURSOR,                  /// North-west cursor
  DEF_CORNERSE_CURSOR,                  /// South-east cursor
  DEF_CORNERSW_CURSOR,                  /// South-west cursor
  DEF_HELP_CURSOR,                      /// Help arrow cursor
  DEF_HAND_CURSOR,                      /// Hand cursor
  DEF_ROTATE_CURSOR,                    /// Rotate cursor
  DEF_WAIT_CURSOR                       /// Wait cursor
  };



/// FOX Event
struct FXEvent {
  FXuint      type;           /// Event type
  FXuint      time;           /// Time of last event
  FXint       win_x;          /// Window-relative x-coord
  FXint       win_y;          /// Window-relative y-coord
  FXint       root_x;         /// Root x-coord
  FXint       root_y;         /// Root y-coord
  FXint       state;          /// Mouse button and modifier key state
  FXint       code;           /// Button, Keysym, or mode; DDE Source
  FXString    text;           /// Text of keyboard event
  FXint       last_x;         /// Window-relative x-coord of previous mouse location
  FXint       last_y;         /// Window-relative y-coord of previous mouse location
  FXint       click_x;        /// Window-relative x-coord of mouse press
  FXint       click_y;        /// Window-relative y-coord of mouse press
  FXint       rootclick_x;    /// Root-relative x-coord of mouse press
  FXint       rootclick_y;    /// Root-relative y-coord of mouse press
  FXuint      click_time;     /// Time of mouse button press
  FXuint      click_button;   /// Mouse button pressed
  FXint       click_count;    /// Click-count
  FXbool      moved;          /// Moved cursor since press
  FXRectangle rect;           /// Rectangle
  FXbool      synthetic;      /// True if synthetic expose event
  FXDragType  target;         /// Target drag type being requested
  };


/// Application Object
class FXApp : public FXObject {

public:
  long onCmdQuit(FXObject*,FXSelector,void*);
  long onCmdDump(FXObject*,FXSelector,void*);
  long onCmdHover(FXObject*,FXSelector,void*);

public:

  /// Messages applications understand
  enum {
    ID_QUIT=1,    /// Terminate the application normally
    ID_DUMP,      /// Dump the current widget tree
    ID_HOVER,
    ID_LAST
    };

public:

  /// Information
  static const FXuchar copyright[];     /// Copyright notice of library

public:

  /**
  * Construct application object; the name and vendor strings are used
  * as keys into the registry database for this application's settings.
  * Only one single application object can be constructed.
  */
  %extend {
    /**
    * Construct application object; the name and vendor strings are used
    * as keys into the registry database for this application's settings
    */
    FXApp(const FXchar* name="Application",const FXchar* vendor="FoxDefault"){
      if(FXApp::instance()){
        return 0;
        }
      else{
          int argc = 1;
          static char* argv[]={(char*)"", 0};
          FX::FXApp* app = new FX::FXApp(name, vendor);
          app->init(argc, argv);
          return app;
        }
      }
  }



  /// Get application name
  const FXString& getAppName() const { return registry.getAppKey(); }

  /// Get vendor name
  const FXString& getVendorName() const { return registry.getVendorKey(); }

  /// Connection to display; this is called by init()
  bool openDisplay(const FXchar* dpyname=NULL);

  /// Close connection to the display
  bool closeDisplay();

  /// Return pointer
  void* getDisplay() const { return display; }

  /// Is application initialized
  bool isInitialized() const { return initialized; }

  /// Get argument count
  FXint getArgc() const { return appArgc; }

  /// Get argument vector
  const FXchar *const *getArgv() const { return appArgv; }

  /// Return true if input method support
  bool hasInputMethod() const;

  /// Get default visual
  FXVisual* getDefaultVisual() const { return defaultVisual; }

  /// Change default visual
  void setDefaultVisual(FXVisual* vis);

  /// Get monochrome visual
  FXVisual* getMonoVisual() const { return monoVisual; }

  /// Get root Window
  FXRootWindow* getRootWindow() const { return root; }

  /// Set root Window
  void setRootWindow(FXRootWindow* rt);

  /// Return window at the end of the focus chain
  FXWindow *getFocusWindow() const;

  /// Get the window under the cursor, if any
  FXWindow *getCursorWindow() const { return cursorWindow; }

  /// Get the active toplevel window, if any
  FXWindow *getActiveWindow() const { return activeWindow; }

  /// Get current popup window, if any
  FXPopup* getPopupWindow() const { return popupWindow; }

  /// Find window from id
  FXWindow* findWindowWithId(FXID xid) const;

  /// Find window from root x,y, starting from given window
  FXWindow* findWindowAt(FXint rx,FXint ry,FXID window=0) const;

  /// Create application's windows
  virtual void create();

  /// Destroy application's windows
  virtual void destroy();

  /// Detach application's windows
  virtual void detach();

  /**
  * Add timeout message to be sent to target object in ms milliseconds;
  * the timer fires only once after the interval expires.  The void* ptr
  * is user data which will be passed into the void* ptr of the message
  * handler.  If a timer with the same target and message already exists,
  * it will be rescheduled.
  */
  void addTimeout(FXObject* tgt,FXSelector sel,FXuint ms=1000,void* ptr=NULL);

  /**
  * Remove timeout identified by tgt and sel.
  */
  void removeTimeout(FXObject* tgt,FXSelector sel);

  /**
  * Return TRUE if given timeout has been set
  */
  bool hasTimeout(FXObject *tgt,FXSelector sel) const;

  /**
  * Return, in ms, the time remaining until the given timer fires.
  * If the timer is past due, 0 is returned.  If there is no such
  * timer, infinity (UINT_MAX) is returned.
  */
  FXuint remainingTimeout(FXObject *tgt,FXSelector sel);

  /**
  * Process any timeouts due at this time.
  */
  void handleTimeouts();

  /**
  * Add a idle processing message to be sent to target object when
  * the system becomes idle, i.e. there are no events to be processed.
  * The void* ptr is user data which will be passed into the void* ptr
  * of the message handler. If a chore with the same target and message
  * already exists, it will be rescheduled.
  */
  void* addChore(FXObject* tgt,FXSelector sel,void *ptr=NULL);

  /**
  * Remove idle processing message identified by tgt and sel.
  */
  void* removeChore(FXObject* tgt,FXSelector sel);

  /**
  * Return TRUE if given chore has been set
  */
  bool hasChore(FXObject *tgt,FXSelector sel) const;

  /**
  * Add signal processing message to be sent to target object when
  * the signal sig is raised; flags are to be set as per POSIX definitions.
  * When immediate is TRUE, the message will be sent to the target right away;
  * this should be used with extreme care as the application is interrupted
  * at an unknown point in its execution.
  */
  void addSignal(FXint sig,FXObject* tgt,FXSelector sel,FXbool immediate=FALSE,FXuint flags=0);

  /// Remove signal message for signal sig
  void removeSignal(FXint sig);

  /**
  * Add a file descriptor fd to be watched for activity as determined
  * by mode, where mode is a bitwise OR (INPUT_READ, INPUT_WRITE, INPUT_EXCEPT).
  * A message of type SEL_IO_READ, SEL_IO_WRITE, or SEL_IO_EXCEPT will be sent
  * to the target when the specified activity is detected on the file descriptor.
  */
  bool addInput(FXInputHandle fd,FXuint mode,FXObject *tgt,FXSelector sel);

  /**
  * Remove input message and target object for the specified file descriptor
  * and mode, which is a bitwise OR of (INPUT_READ, INPUT_WRITE, INPUT_EXCEPT).
  */
  bool removeInput(FXInputHandle fd,FXuint mode);

  /// Return key state of given key
  bool getKeyState(FXuint keysym) const;

  /// Peek to determine if there's an event
  bool peekEvent();

  /// Perform one event dispatch; return true if event was dispatched
  bool runOneEvent(bool blocking=true);

  /**
  * Run the main application event loop until stop() is called,
  * and return the exit code passed as argument to stop().
  */
  FXint run();

  /**
  * Run an event loop till some flag becomes non-zero, and
  * then return.
  */
  FXint runUntil(FXuint& condition);

  /**
  * Run event loop while events are available, non-modally.
  * Return when no more events, timers, or chores are outstanding.
  */
  FXint runWhileEvents();

  /**
  * Run event loop while there are events are available in the queue.
  * Returns 1 when all events in the queue have been handled, and 0 when
  * the event loop was terminated due to stop() or stopModal().
  * Except for the modal window and its children, user input to all windows
  * is blocked; if the modal window is NULL, all user input is blocked.
  */
  FXint runModalWhileEvents(FXWindow* window=NULL);

  /**
  * Run modal event loop, blocking keyboard and mouse events to all windows
  * until stopModal is called.
  */
  FXint runModal();

  /**
  * Run a modal event loop for the given window, until stop() or stopModal() is
  * called. Except for the modal window and its children, user input to all
  * windows is blocked; if the modal window is NULL all user input is blocked.
  */
  FXint runModalFor(FXWindow* window);

  /**
  * Run modal while window is shown, or until stop() or stopModal() is called.
  * Except for the modal window and its children, user input to all windows
  * is blocked; if the modal window is NULL all user input is blocked.
  */
  FXint runModalWhileShown(FXWindow* window);

  /**
  * Run popup menu while shown, until stop() or stopModal() is called.
  * Also returns when entering previous cascading popup menu.
  */
  FXint runPopup(FXWindow* window);

  /// True if the window is modal
  bool isModal(FXWindow* window) const;

  /// Return window of current modal loop
  FXWindow* getModalWindow() const;

  /// Return mode of current modal loop
  FXModality getModality() const;

  /**
  * Terminate the outermost event loop, and all inner modal loops;
  * All more deeper nested event loops will be terminated with code equal
  * to 0, while the outermost event loop will return code equal to value.
  */
  void stop(FXint value=0);

  /**
  * Break out of the matching modal loop, returning code equal to value.
  * All deeper nested event loops are terminated with code equal to 0.
  */
  void stopModal(FXWindow* window,FXint value=0);

  /**
  * Break out of the innermost modal loop, returning code equal to value.
  */
  void stopModal(FXint value=0);

  /// Force GUI refresh
  void forceRefresh();

  /// Schedule a refresh
  void refresh();

  /// Flush pending repaints
  void flush(bool sync=false);

  /**
  * Paint all windows marked for repainting.
  * On return all the applications windows have been painted.
  */
  void repaint();

  /**
  * Initialize application.
  * Parses and removes common command line arguments, reads the registry.
  * Finally, if connect is TRUE, it opens the display.
  */
  virtual void init(int& argc,char** argv,bool connect=true);

  /**
  * Exit application.
  * Closes the display and writes the registry.
  */
  virtual void exit(FXint code=0);

  /**
  * Return a reference to the registry.  The registry keeps
  * settings and configuration information for an application,
  * which are automatically loaded when the application starts
  * up, and saved when the application terminates.
  */
  FXRegistry& reg(){ return registry; }

  /// Register new DND type
  FXDragType registerDragType(const FXString& name) const;

  /// Get drag type name
  FXString getDragTypeName(FXDragType type) const;

  /// Return drag window if a drag operation is in progress
  FXWindow* getDragWindow() const { return dragWindow; }

  /// Beep
  void beep();

  /// Return application instance
  static inline FXApp* instance(){ return app; }

  /// Change default font
  void setNormalFont(FXFont* font);

  /// Return default font
  FXFont* getNormalFont() const { return normalFont; }

  /// Begin of wait-cursor block; wait-cursor blocks may be nested.
  void beginWaitCursor();

  /// End of wait-cursor block
  void endWaitCursor();

  /// Change to a new wait cursor
  void setWaitCursor(FXCursor *cur);

  /// Return current wait cursor
  FXCursor* getWaitCursor() const { return waitCursor; }

  /// Obtain a default cursor
  FXCursor* getDefaultCursor(FXDefaultCursor which) const { return cursor[which]; }

  /// Change default cursor
  void setDefaultCursor(FXDefaultCursor which,FXCursor* cur);

  /**
  * Write a window and its children, and all resources reachable from this
  * window, into the stream store. (EXPERIMENTAL!)
  */
  FXbool writeWindow(FXStream& store,FXWindow *window);

  /**
  * Read a window and its children from the stream store, and append
  * it under father; note it is initially not created yet. (EXPERIMENTAL!)
  */
  FXbool readWindow(FXStream& store,FXWindow*& window,FXWindow* father,FXWindow* owner);

  /**
  * Return a reference to the application-wide mutex.
  * Normally, the main user interface thread holds this mutex,
  * insuring that no other threads are modifying data during the
  * processing of user interface messages. However, whenever the
  * main user interface thread blocks for messages, it releases
  * this mutex, to allow other threads to modify the same data.
  * When a new message becomes available, the main user interface
  * thread regains the mutex prior to dispatching the message.
  * Other threads should hold this mutex only for short durations,
  * so as to not starve the main user interface thread.
  */
  FXMutex& mutex(){ return appMutex; }

  /**
  * Change message translator.
  * The new translator will be owned by FXApp.
  */
  void setTranslator(FXTranslator* trans);

  /// Return message translator
  FXTranslator* getTranslator() const { return translator; }

  /// Obtain application-wide settings
  FXuint getTypingSpeed() const { return typingSpeed; }
  FXuint getClickSpeed() const { return clickSpeed; }
  FXuint getScrollSpeed() const { return scrollSpeed; }
  FXuint getScrollDelay() const { return scrollDelay; }
  FXuint getBlinkSpeed() const { return blinkSpeed; }
  FXuint getAnimSpeed() const { return animSpeed; }
  FXuint getMenuPause() const { return menuPause; }
  FXuint getTooltipPause() const { return tooltipPause; }
  FXuint getTooltipTime() const { return tooltipTime; }
  FXint getDragDelta() const { return dragDelta; }
  FXint getWheelLines() const { return wheelLines; }
  FXint getScrollBarSize() const { return scrollBarSize; }

  /// Change application-wide settings
  void setTypingSpeed(FXuint speed);
  void setClickSpeed(FXuint speed);
  void setScrollSpeed(FXuint speed);
  void setScrollDelay(FXuint delay);
  void setBlinkSpeed(FXuint speed);
  void setAnimSpeed(FXuint speed);
  void setMenuPause(FXuint pause);
  void setTooltipPause(FXuint pause);
  void setTooltipTime(FXuint time);
  void setDragDelta(FXint delta);
  void setWheelLines(FXint lines);
  void setScrollBarSize(FXint size);

  /// Obtain default colors
  FXColor getBorderColor() const { return borderColor; }
  FXColor getBaseColor() const { return baseColor; }
  FXColor getHiliteColor() const { return hiliteColor; }
  FXColor getShadowColor() const { return shadowColor; }
  FXColor getBackColor() const { return backColor; }
  FXColor getForeColor() const { return foreColor; }
  FXColor getSelforeColor() const { return selforeColor; }
  FXColor getSelbackColor() const { return selbackColor; }
  FXColor getTipforeColor() const { return tipforeColor; }
  FXColor getTipbackColor() const { return tipbackColor; }
  FXColor getSelMenuTextColor() const { return selMenuTextColor; }
  FXColor getSelMenuBackColor() const { return selMenuBackColor; }

  /// Change default colors
  void setBorderColor(FXColor color);
  void setBaseColor(FXColor color);
  void setHiliteColor(FXColor color);
  void setShadowColor(FXColor color);
  void setBackColor(FXColor color);
  void setForeColor(FXColor color);
  void setSelforeColor(FXColor color);
  void setSelbackColor(FXColor color);
  void setTipforeColor(FXColor color);
  void setTipbackColor(FXColor color);
  void setSelMenuTextColor(FXColor color);
  void setSelMenuBackColor(FXColor color);

  /// Get number of existing windows
  FXuint getWindowCount() const { return windowCount; }

  /// Save
  virtual void save(FXStream& store) const;

  /// Load
  virtual void load(FXStream& store);

  /// Dump widget information
  void dumpWidgets() const;

  /// Destroy the application and all reachable resources
  virtual ~FXApp();
  };

}
