/* FXImageFrame.i */

%pythonappend FX::FXImageFrame::FXImageFrame %{
  self.thisown = False
%}
%pythonappend FX::FXPyImageFrame::FXPyImageFrame %{
  self.thisown = False
  FXPyRegister(self)
%}


#ifndef FXFRAME_H
#include "FXFrame.h"
#endif

namespace FX {


/**
* The image frame is a simple frame widget displaying
* an image; the image is not owned by the image frame so
* it must be explicitly deleted elsewhere.
*/
class FXImageFrame : public FXFrame {
public:
  long onPaint(FXObject*,FXSelector,void* ptr);
public:

  /// Construct image frame and pass it an image
  FXImageFrame(FXComposite* p,FXImage *img,FXuint opts=FRAME_SUNKEN|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);

  /// Create window
  virtual void create();

  /// Get default width
  virtual FXint getDefaultWidth();

  /// Get default height
  virtual FXint getDefaultHeight();

  /// Change the image being displayed
  void setImage(FXImage* img);

  /// Return the current image
  FXImage* getImage() const { return image; }

  /// Set the current justification mode.
  void setJustify(FXuint mode);

  /// Get the current justification mode.
  FXuint getJustify() const;

  /// Save to stream
  virtual void save(FXStream& store) const;

  /// Load from stream
  virtual void load(FXStream& store);

  /// Destroy the widget, but do not destroy the image
  virtual ~FXImageFrame();
  };

class FXPyImageFrame : public FXImageFrame {
    FXDECLARE(FXPyImageFrame)
public:
    FXPyImageFrame(FXComposite* p,FXImage *img,FXuint opts=FRAME_SUNKEN|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};
}

