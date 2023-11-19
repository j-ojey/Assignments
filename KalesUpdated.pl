% Facts about diseases and symptoms for kale
symptom(kale, downy_mildew, yellow_spots_on_leaves).
symptom(kale, downy_mildew, wilting_leaves).
symptom(kale, black_rot, dark_lesions_on_leaves).
symptom(kale, black_rot, yellowing_of_veins).
symptom(kale, aphid_infestation, sticky_residue).
symptom(kale, aphid_infestation, distorted_growth).

% Rules for disease detection in kale
detect_disease(Symptoms, Disease) :-
    member(Disease, [downy_mildew, black_rot, aphid_infestation]),
    detect_disease_rules(Symptoms, Disease).

detect_disease_rules(Symptoms, downy_mildew) :-
    member(yellow_spots_on_leaves, Symptoms),
    member(wilting_leaves, Symptoms).

detect_disease_rules(Symptoms, black_rot) :-
    member(dark_lesions_on_leaves, Symptoms),
    member(yellowing_of_veins, Symptoms).

detect_disease_rules(Symptoms, aphid_infestation) :-
    member(sticky_residue, Symptoms),
    member(distorted_growth, Symptoms).

% Rule to display the detected disease
display_result(Disease) :-
    format('Detected Disease: ~w~n', [Disease]).

% Rule for no disease detected
no_disease_detected :-
    write('No disease detected.').

% Main detection predicate
detect_kale_disease(Symptoms) :-
    detect_disease(Symptoms, Disease),
    display_result(Disease).

detect_kale_disease(_) :-
    no_disease_detected.

