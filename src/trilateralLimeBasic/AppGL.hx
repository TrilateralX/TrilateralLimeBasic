package trilateralLimeBasic;

import lime.graphics.RenderContext;
import lime.graphics.WebGLRenderContext;
//import lime.Assets;
//import lime.utils.AssetType;
import lime.utils.Float32Array;
import lime.utils.UInt16Array;
import lime.math.Matrix4;



import kitGL.glLime.Shaders;
import kitGL.glLime.HelpGL;
import kitGL.glLime.BufferGL;

#if js
import kitGL.glWeb.Texture;
import kitGL.glWeb.DivertTrace;
#end

import trilateral3.Trilateral;
import trilateral3.drawing.Pen;
import trilateral3.geom.FlatColorTriangles;
import trilateral3.nodule.PenNodule;


class AppGL{
    var program: GLProgram;
    public var pen: Pen;
    public var penNodule = new PenNodule();
    public var width:  Int;
    public var height: Int;
    public
    function new( width_: Int, height_: Int ){
        width = width_;
        height = height_;
        setup();
    }
    // override this
    public
    function update(){
        
    }
    inline
    function setup( gl: WebGLRenderContext ){
        
        program = programSetup( gl, vertexString0, fragmentString0 );
        draw( penNodule.pen );
        interleaveXYZ_RGBA( gl
                          , program
                          , penNodule.data
                          , 'vertexPosition', 'vertexColor' );
    }
    // override this
    public
    function draw( pen: Pen ){
    }
    function render( gl: WebGLRenderContext ){
        clearAll( gl, width, height );
        gl.useProgram( program );
        gl.drawArrays( RenderingContext.TRIANGLES, 0, penNodule.size );
    }
}