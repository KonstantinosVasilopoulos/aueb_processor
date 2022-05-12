library ieee;
use ieee.std_logic_1164.all;

-- Κωνσταντινος Βασιλοπουλος 3180018
-- Ευθυμιος Παπαγεωργιου 3180144

-- Παρατηρηση
-- Παρατηρουμε πως οι registers καθυστερουν ενα κυκλο ρολογιου καθε φορα πρωτου αποκτησουν
-- τιμες. Πιο συγκεκριμενα, οι δυο πρωτοι καταχωρητες αποκτουν τιμες στο δευτερο clock pulse,
-- ενω ο τριτος καταχωρητης στο τριτο pulse. Αυτο σημαινει, πως και η ALU μπορει να ξεκινησει 
-- τους υπολογισμους της κατα τον δευτερο παλμο.

entity AUEB_PROCESSOR is
port(output: out std_logic);
end AUEB_PROCESSOR;

architecture ProcessorLogic of AUEB_PROCESSOR is

begin
	output <= '0';
end ProcessorLogic;