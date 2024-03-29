/* FXPopup.i */

%pythonappend FX::FXPopup::FXPopup %{
  self.thisown = False
%}
%pythonappend FX::FXPyPopup::FXPyPopup %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXSHELL_H
#include "FXShell.h"
#endif

namespace FX {


/// Popup internal orientation
enum {
  POPUP_VERTICAL   = 0,               /// Vertical orientation
  POPUP_HORIZONTAL = 0x00020000,      /// Horizontal orientation
  POPUP_SHRINKWRAP = 0x00040000       /// Shrinkwrap to content
  };



/// Popup window
class FXPopup : public FXShell {
public:
  long onPaint(FXObject*,FXSelector,void*);
  long onFocusUp(FXObject*,FXSelector,void*);
  long onFocusDown(FXObject*,FXSelector,void*);
  long onFocusLeft(FXObject*,FXSelector,void*);
  long onFocusRight(FXObject*,FXSelector,void*);
  long onFocusNext(FXObject*,FXSelector,void*);
  long onFocusPrev(FXObject*,FXSelector,void*);
  long onEnter(FXObject*,FXSelector,void*);
  long onLeave(FXObject*,FXSelector,void*);
  long onMotion(FXObject*,FXSelector,void*);
  long onMap(FXObject*,FXSelector,void*);
  long onButtonPress(FXObject*,FXSelector,void*);
  long onButtonRelease(FXObject*,FXSelector,void*);
  long onUngrabbed(FXObject*,FXSelector,void*);
  long onCmdUnpost(FXObject*,FXSelector,void*);
  long onKeyPress(FXObject*,FXSelector,void*);
  long onKeyRelease(FXObject*,FXSelector,void*);
  long onCmdChoice(FXObject*,FXSelector,void*);
public:
  enum {
    ID_CHOICE=FXShell::ID_LAST,
    ID_LAST=ID_CHOICE+1000
    };
public:

  /// Construct popup pane
  FXPopup(FXWindow* owner,FXuint opts=POPUP_VERTICAL|FRAME_RAISED|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

  /// Return the default width of this window
  virtual FXint getDefaultWidth();

  /// Return the default height of this window
  virtual FXint getDefaultHeight();

  /// Perform layout
  virtual void layout();

  /// Return a pointer to the prior active popup
  FXPopup* getPrevActive() const { return prevActive; }

  /// Return a pointer to the next active popup
  FXPopup* getNextActive() const { return nextActive; }

  /// Move the focus to this window
  virtual void setFocus();

  /// Remove the focus from this window
  virtual void killFocus();

  /// Show this window
  virtual void show();

  /// Hide this window
  virtual void hide();

  /// Change frame style
  void setFrameStyle(FXuint style);

  /// Return frame style
  FXuint getFrameStyle() const;

  /// Return border width
  FXint getBorderWidth() const { return border; }

  /// Change highlight color
  void setHiliteColor(FXColor clr);

  /// Return highlight color
  FXColor getHiliteColor() const { return hiliteColor; }

  /// Change shadow color
  void setShadowColor(FXColor clr);

  /// Return shadow color
  FXColor getShadowColor() const { return shadowColor; }

  /// Change border color
  void setBorderColor(FXColor clr);

  /// Return border color
  FXColor getBorderColor() const { return borderColor; }

  /// Change base color
  void setBaseColor(FXColor clr);

  /// Return base color
  FXColor getBaseColor() const { return baseColor; }

  /// Popup the menu and grab to the given owner
  virtual void popup(FXWindow* grabto,FXint x,FXint y,FXint w=0,FXint h=0);

  /// Pop down the menu
  virtual void popdown();

  /// Return current grab owner
  FXWindow* getGrabOwner() const;

//   /// Popup the menu and grab to the given owner
//   virtual FXint popup(FXint x,FXint y,FXint w=0,FXint h=0);
//
//   /// Pop down the menu
//   virtual void popdown(FXint value);

  /// Return popup orientation
  FXuint getOrientation() const;

  /// Change popup orientation
  void setOrientation(FXuint orient);

  /// Return shrinkwrap mode
  FXbool getShrinkWrap() const;

  /// Change shrinkwrap mode
  void setShrinkWrap(FXbool sw);

  virtual bool doesSaveUnder() const;

  /// Destructor
  virtual ~FXPopup();
  };

class FXPyPopup : public FXPopup {
    FXDECLARE(FXPyPopup)
public:
    FXPyPopup(FXWindow* owner,FXuint opts=POPUP_VERTICAL|FRAME_RAISED|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
