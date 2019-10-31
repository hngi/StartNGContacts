<?php

/**
 * subjectLinePlaceholders plugin version 1.0a4
 *
 * @category  phplist
 * @package   subjectLinePlaceholders Plugin
 * @author    Arnold V. Lesikar
 * @copyright 2013, 2014 Arnold V. Lesikar
 * @license   http://www.gnu.org/licenses/gpl.html GNU General Public License, Version 3
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 *
 * 
 * This plugin allows placeholders to be used in the subject line of a message which
 * will be replaced by the value of the corresponding subscriber attribute in the 
 * message being sent to that subscriber.
 *
 * The placeholder is the attribute name in uppercase and enclosed in square brackets. If
 * the replacement is to be in uppercase, there must be an '!' immediately after the
 * opening bracket.
 *
 * Thus if subscribers have attributes named 'City' and 'State' and the state is to be
 * in upper case, a subject line might read:
 *
 *            A message for subscribers in [CITY], [!STATE]
 *
 * For a subscriber in Dallas, Texas, this would result in the subject line:
 *
 *			  A message for subscribers in Dallas, TEXAS
 *
 * Conditional placeholders are also supported, allowing an alternative replacement
 * when an attribute has no specified value. Thus [NAME?Subscriber] results in
 * 'Subscriber' being used in the subject line if the user's 'Name' attribute is empty.
 * If upper case is specified by '!' after the opening bracket, the alternative value
 * will be transformed to upper case, just as the attribute value would be.
 * 
 */

/**
 * Registers the plugin with phplist
 * 
 * @category  phplist
 * @package   subjectLinePlaceholdersPlugin
 */

class subjectLinePlaceholdersPlugin extends phplistPlugin
{
    /*
     *  Inherited variables
     */
    public $name = 'Subject Line Placeholders Plugin';
    public $version = '1.0a4';
    public $enabled = true;
    public $authors = 'Arnold Lesikar';
    public $description = 'Allows the use of placeholders for user attributes in the subject line of messages';
    public $documentationUrl = 'https://resources.phplist.com/plugin/subjectlineplaceholder';
    
    private $user_att_values = array();
    
    private function parseSubjectHolders($content,$atts = array()) 
    {
  		foreach ($atts as $key => $val) {
    		if (stripos($content,'['.$key.']') !== false)
        		$content = str_ireplace('['.$key.']',$val,$content);
        	elseif (stripos($content,'[!'.$key.']') !== false)
      	 		$content = str_ireplace('['.$key.']',strtoupper($val),$content);
      	if (preg_match('/\[(\!)?'.$key.'(\?([^\]]+))?\]/i',$content,$regs)) {
      		if ($regs[1] == '!') {
      			$val = strtoupper($val);
      			if ($regs[3])
      				$regs[3] = strtoupper($regs[3]);
      		}
    	    if (!empty($val))
        	  	$content = str_ireplace($regs[0],$val,$content);
        	else
          		$content = str_ireplace($regs[0],$regs[3],$content);
    		}  
    	}  
  		return $content;
	}
	
	// This plugin has no web pages. So make sure that nothing appears in the 
	// dashboard menu
	function adminmenu() {
    	return array ();
  	}

	public function __construct()
    {

        $this->coderoot = dirname(__FILE__) . '/subjectLinePlaceholdersPlugin/';
        
    	parent::__construct();
    }
    

/* setFinalDestinationEmail
  * purpose: change the actual recipient based on user Attribute values:
  * parameters: 
  * messageid: message being sent 
  * uservalues: array of "attributename" => "attributevalue" of all user attributes
  * email: email that this message is current set to go out to
  * returns: email that it should go out to
  *
  * This is where we can grab user attribute values for evaluating placeholders in 
  * the subject line. Place holders in the body of the message are already evaluated
  * by PHP list. 
  *
  * 
 */
  
	public function setFinalDestinationEmail($messageid, $uservalues, $email) { 
		$this->user_att_values = $uservalues;
    	return $email;
 	 }
    
  /* messageHeaders  -- The original purpose of this function is:
   *
   * return headers for the message to be added, as "key => val"
   *
   * @param object $mail
   * @return array (headeritem => headervalue)
   *
   *
   * This is the last point at which we can reach into the queue processing and
   * modify the subject line.
   *
 */
  
  	public function messageHeaders($mail)
  	{
  		if (function_exists('parsePlaceHolders')) {// Function is not defined when system messages are mailed
  			$mail->Subject = $this->parseSubjectHolders($mail->Subject, $this->user_att_values);
            ## run it through the central system placeholder parsing
            ## that activates the %% fallback separator
            $mail->Subject = parsePlaceHolders($mail->Subject,$this->user_att_values);
        }
  		
  		return array(); //@@@
  	}

}
  
