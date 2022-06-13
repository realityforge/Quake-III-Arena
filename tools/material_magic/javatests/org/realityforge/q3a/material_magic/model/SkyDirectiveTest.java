package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class SkyDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final SkyDirective directive = new SkyDirective();

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertTrue( directive.isDefault() );
    assertFalse( directive.isNonDefault() );

    directive.setFarBox( "myFarBox" );

    assertEquals( "skyparms myFarBox - -\n", directive.toString() );
    assertEquals( "skyparms myFarBox - -\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "skyparms myFarBox - -\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( directive.isDefault() );
    assertTrue( directive.isNonDefault() );

    directive.setNearBox( "myNearBox" );

    assertEquals( "skyparms myFarBox - myNearBox\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "skyparms myFarBox - myNearBox\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setCloudHeight( SkyDirective.DEFAULT_CLOUD_HEIGHT );

    assertEquals( "skyparms myFarBox - myNearBox\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "skyparms myFarBox - myNearBox\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setCloudHeight( 200 );

    assertEquals( "skyparms myFarBox 200 myNearBox\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "skyparms myFarBox 200 myNearBox\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setNearBox( null );

    assertEquals( "skyparms myFarBox 200 -\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "skyparms myFarBox 200 -\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final SkyDirective directive1 = new SkyDirective();
    final SkyDirective directive2 = new SkyDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFarBox( "X" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFarBox( "X" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setNearBox( "Y" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setNearBox( "Y" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setCloudHeight( 112 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setCloudHeight( 112 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
